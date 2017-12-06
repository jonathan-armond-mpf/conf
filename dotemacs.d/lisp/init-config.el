;;; General settings.

(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize)) ; Set env vars from shell

;;; Configure for Mac.
(when (eq system-type 'darwin)
  (setq mac-option-key-is-meta t)
  (setq mac-command-key-is-meta nil)
  (setq mac-command-modifier 'super)
  (setq mac-option-modifier 'meta)
  (global-set-key (kbd "M-N") 'new-frame)
  (global-set-key (kbd "M-`") 'other-frame)
                                        ; Use Key Chain
  (setq auth-sources '(macos-keychain-internet macos-keychain-generic))
  (setq locate-command "/usr/bin/mdfind")
  ;; Fix Mac hash key
  (global-set-key (kbd "M-3") '(lambda () (interactive) (insert "#")))
  (setq ns-use-native-fullscreen nil)

  (when (executable-find "gls")
    (setq insert-directory-program "gls"))

  (defun system-move-file-to-trash (file)
    "Use \"trash\" to move FILE to the system trash.
When using Homebrew, install it using \"brew install trash\"."
    (call-process (executable-find "trash")
                  nil 0 nil
                  file)))



;;; Misc global options

(setq locale-coding-system 'utf-8)     ; Coding system
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8)
(defalias 'yes-or-no-p 'y-or-n-p)          ; Replace y-e-s by y
(delete-selection-mode 1)             ; Clear seln on keypress
(setq completion-ignore-case t         ; Ignore case in completion
      read-file-name-completion-ignore-case t)
(transient-mark-mode t) ; Disable mark when changing buffer
(setq frame-title-format (list "%b " (getenv "USER") "@" (system-name)))
(setq gc-cons-threshold (* 100 1024 1024)) ; GC less often

;; Basic text editing parameters
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'visual-line-mode)
(setq-default fill-column 80)
(setq-default default-tab-width 4)
(setq-default indent-tabs-mode nil)    ; No tabs
(setq require-final-newline t)
(electric-pair-mode) ; Automatic pairing of parentheses

(setq diff-switches "-u") ; unified diffs
(global-auto-revert-mode 1) ; automatically revert file if changed on disk

;; Save history
;(setq savehist-additional-variables)
(setq savehist-file "~/.emacs.d/savehist")
(savehist-mode t)
(setq-default save-place t)

;; Backups
(setq backup-directory-alist
      `((".*" . ,(expand-file-name "backup" user-emacs-directory)))
      make-backup-files t
      version-control t
      delete-old-versions t)

;; Auto-saving
(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t)))


;; Confirm closing
(setq confirm-kill-emacs 'y-or-n-p)

;; Window switching
(use-package windmove
  :config
  (windmove-default-keybindings))
;;; Window management
(winner-mode 1)

;; Buffer cleanup
(use-package midnight
  :config
  (setq midnight-period (* 6 60 60)))

;;; Browsing within Emacs
;(require 'w3m-load)
;(setq browse-url-browser-function 'w3m-browse-url)

;;; Tramp
(use-package tramp
  :config
  (setq tramp-default-method "ssh"))


;; Spelling
(add-hook 'text-mode-hook (lambda () (flyspell-mode 1)))
(setq ispell-program-name "/usr/local/bin/aspell")
(setq ispell-dictionary "english")


;;; Evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  ;; Make movement keys work in visual lines mode.
  (define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
  (define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
  ;; Make horizontal movement cross lines.
  (setq-default evil-cross-lines t)

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))

  (use-package evil-nerd-commenter
    :ensure t
    :config
    (evilnc-default-hotkeys))

  (use-package evil-numbers
    :ensure t
    :config
    (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
    (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt))

  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1)))

;;; Shell
(add-hook 'eshell-mode-hook
          (lambda ()
            (setenv "PAGER" "cat")
            (setq eshell-path-env (concat "/Users/jon/Library/Haskell/bin:" eshell-path-env))))

;;; Helm
(use-package helm
  :ensure t
  :config
  (require 'helm-config)
  (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (global-set-key (kbd "C-x C-r") #'helm-recentf)
  (helm-mode 1))

;; Flycheck
(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode))

;; YASnippet
(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1))

;; Company completion
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))

;; Line numbers
(use-package nlinum-relative
  :ensure t
  :config
  (nlinum-relative-setup-evil)
  (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; Recent files
(recentf-mode 1)
(setq-default recent-save-file "~/.emacs.d/recentf")

;; Very large files
(use-package vlf
  :ensure t
  :config
  (require 'vlf-setup))

;; Magit
(use-package magit
  :ensure t)
