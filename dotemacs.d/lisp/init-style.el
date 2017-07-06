;;; Style config

; Set font.
(set-face-attribute 'default nil :family "Source Code Pro" :height 130)
(global-font-lock-mode t)

;; Cleanup UI
(dolist (mode '(tool-bar-mode set-scroll-bar-mode tooltip-mode blink-cursor-mode))
  (when (fboundp mode) (funcall mode -1)))

(setq ring-bell-function (lambda ())) ; no bell
(setq inhibit-startup-message t
      initial-major-mode 'fundamental-mode
      make-pointer-invisible t) ; hide pointer while typing

;; Mouse scrolling
(setq mouse-wheel-scroll-amount '(5 ((control) . 1))) ;; one line at a time with control
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't)

;; Color scheme
(load-theme 'wombat t)

;; Smart-mode-line
(use-package smart-mode-line
  :ensure t
  :config
  (sml/setup)
  (setq sml/shorten-modes t)

  (use-package rich-minority
    :ensure t
    :config
    (add-to-list 'rm-blacklist (list " company" " yas" " Helm" " Undo-Tree"))
    (rich-minority-mode 1)))
;; (use-package powerline
;;   :ensure t
;;   :config
;;   (powerline-center-evil-theme))

;;; Modeline
;; (line-number-mode t)                   ; Show line numbers
;; (column-number-mode t)                 ; Show column numbers
;; (setq display-time-day-and-date t
;;       display-time-24hr-format t
;;       display-time-default-load-average nil)
;; (display-time)
;; (display-battery-mode)

