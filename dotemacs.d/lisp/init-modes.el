;;; Modes

;; Show white space
(add-hook 'prog-mode-hook
          (lambda () (setq show-trailing-whitespace t)))
(add-hook 'matlab-mode-hook
          (lambda () (setq show-trailing-whitespace t)))

;; C style
(require 'cc-mode)
(setq c-default-style '((java-mode . "java")
                        (awk-mode . "awk")
                        (other . "linux")))
(setq-default c-basic-offset 4)
(setq-default c-indent-level 4)
(defun my-c-init-hook ()
  (define-key c-mode-base-map "\C-m" 'c-context-line-break))
(add-hook 'c-initialization-hook 'my-c-init-hook)
(defun my-c-mode-common-hook ()
  (c-set-offset 'innamespace 0)
  (c-set-offset 'inline-open 0)
  (setq show-trailing-whitespace t)
  (set (make-local-variable 'compile-command)
       "make -j2 -k")
  (local-set-key (kbd "C-c o") 'ff-find-other-file))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;; Fortran
(add-hook 'f90-mode-hook 'turn-on-auto-fill)
(add-hook 'f90-mode-hook
          '(lambda () (abbrev-mode 1)))
(add-to-list 'auto-mode-alist '("\\.f03\\'" . f90-mode))

;;; Gnuplot
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(add-to-list 'auto-mode-alist '("\\.gnu$" . gnuplot-mode))
(add-to-list 'auto-mode-alist '("\\.pyx$" . gnuplot-mode))

;;; Matlab
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(with-eval-after-load "matlab" (define-key matlab-mode-map "\M-;" nil))
(add-to-list 'auto-mode-alist '("\\.m\\'" . matlab-mode))
(setq matlab-indent-function nil
      matlab-indent-level 2
      matlab-cont-level 2
      matlab-shell-ask-MATLAB-for-completions nil)
(add-hook 'matlab-mode-hook
          (lambda ()
            (progn
              (turn-off-auto-fill)
              (linum-mode 1)
              (show-paren-mode))))
(add-hook 'matlab-shell-mode-hook
          (lambda ()
            (setq comint-input-ring-file-name (expand-file-name "matlab-hist" user-emacs-directory))))


;;; Lua
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;; GLSL
(autoload 'glsl-mode "glsl-mode" "GLSL major mode" t)
(add-to-list 'auto-mode-alist '("\\.vert\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.frag\\'" . glsl-mode))
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . glsl-mode))

;;; C#
(autoload 'csharp-mode "csharp-mode" "Major mode for editing C# code." t)
(setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))


;;; HTML
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . html-mode))
(add-to-list 'auto-mode-alist '("\\.rml\\'" . html-mode))

;;; CSS
(add-to-list 'auto-mode-alist '("\\.rcss\\'" . css-mode))

;; Swap square brackets and angle brackets in HTML
(add-hook 'html-mode-hook '(lambda ()
                            (define-key html-mode-map (kbd "[") (lambda () (interactive) (insert "<")))
                            (define-key html-mode-map (kbd "]") (lambda () (interactive) (insert ">")))
                            (define-key html-mode-map (kbd "<") (lambda () (interactive) (insert "[")))
                            (define-key html-mode-map (kbd ">") (lambda () (interactive) (insert "]")))))


;;; Python
(setq python-shell-interpreter "/usr/local/bin/python3")
;; (use-package conda
  ;; :ensure t
  ;; :config
  ;; (conda-env-autoactivate-mode))

;;; Ctags
(setq ctags-command "/opt/local/bin/ctags -e -R ")
(setq tags-revert-without-query t)
(global-set-key (kbd "<S-f3>") 'ctags-create-or-update-tags-table)

;;; Markdown
(use-package markdown-mode
  :ensure t
  :config
  (add-hook 'markdown-mode-hook (lambda () (visual-line-mode 1))))
