;;;; Global keyboard shortcuts
(require 'flyspell)

;; Disable annoying suspend
(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "C-x C-z"))

(global-set-key (kbd "C-x m") 'eshell)
(global-set-key (kbd "C-c f") 'elfeed)
(global-set-key (kbd "C-M-g") 'magit-status)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-;") 'comment-region)
(global-set-key (kbd "C-x ;")
                '(lambda ()
                   (interactive)
                   (comment-or-uncomment-region
                    (region-region) (beginning-end))))

;; Editing
(global-set-key (kbd "M-[") 'align)
(global-set-key (kbd "C-x a r") 'align-regexp)
(global-set-key (kbd "C-x w") 'whitespace-cleanup)

;; Special letters
(global-set-key (kbd "s-l") (lambda () (interactive) (insert "λ")))
(global-set-key (kbd "s-3") (lambda () (interactive) (insert "#")))

;; Window switching
(global-set-key (kbd "C-.") 'other-window)

;; Spelling
(define-key flyspell-mode-map (kbd "C-$") 'ispell-word)

;; Useful functions
(defun unfill-lines (start end)
  (interactive "r")
  (replace-string "
" " " nil start end))

;; Keep the zapped to char
(defadvice zap-to-char (after my-zap-to-char-advice (arg char) activate)
    "Kill up to the ARG'th occurence of CHAR, and leave CHAR. If
  you are deleting forward, the CHAR is replaced and the point is
  put before CHAR"
    (insert char)
    (if (< 0 arg) (forward-char -1)))

;; Increment number
(defun increment-number-at-point ()
      (interactive)
      (skip-chars-backward "0123456789")
      (or (looking-at "[0123456789]+")
          (error "No number at point"))
      (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))
(global-set-key (kbd "C-c +") 'increment-number-at-point)

;; Function keys
(defun start-or-switch (function buffer-name &optional split-other)
  "If BUFFER-NAME exists switch to it, else run FUNCTION"
  (if (not (get-buffer buffer-name))
      (progn
        (when split-other
          (split-window-sensibly (selected-window))
          (other-window 1))
        (funcall function))
    (switch-to-buffer-other-window buffer-name)))

;; Get size of dired files.
;(define-key dired-mode-map (kbd "z") 'dired-get-size)


;; Mail
(global-set-key (kbd "<f1>") (lambda ()
                               (interactive)
                               (start-or-switch 'mu4e "*mu4e-main*" t)))

;; shell
(global-set-key (kbd "<f2>") (lambda ()
                               (interactive)
                               (start-or-switch 'shell "*shell*" t)))

;; matlab
(global-set-key (kbd "<f5>") (lambda ()
                               (interactive)
                               (start-or-switch 'matlab-shell "*MATLAB*")))

;; haskell
(global-set-key (kbd "<f6>")
                (lambda ()
                  (interactive)
                  (start-or-switch 'haskell-interactive-bring "*haskell*")))

;; elfeed
(global-set-key (kbd "<f7>")
                (lambda ()
                  (interactive)
                  (start-or-switch 'elfeed "*elfeed-search*")))

