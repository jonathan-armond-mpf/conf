;;; jwa's .emacs
(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-archive-priorities
      '(("org" . 11) ("melpa-stable" . 10) ("gnu" . 5) ("melpa" . 0)))

(setq package-enable-at-startup nil)
(package-initialize)

(add-to-list 'load-path (expand-file-name "site-lisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file "~/.emacs.d/custom.el")
(load custom-file 'noerror)

(setq debug-on-error t) ; Debug during init. Switch off at end.

;;; Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;;; Load split files

(load-library "init-config")
(load-library "init-modes")
(load-library "init-keys")
(load-library "init-style")

(load-library "init-lisp")
(load-library "init-haskell")
(load-library "init-latex")
(load-library "init-org")


(setq debug-on-error nil) ; Turn off debug.
