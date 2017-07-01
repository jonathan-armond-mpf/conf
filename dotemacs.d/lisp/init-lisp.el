;;; Lisp

;; Hyperspec
(eval-after-load "slime"
  '(progn
     (setq common-lisp-hyperspec-root
           "/usr/local/share/doc/hyperspec/HyperSpec/")
     (setq common-lisp-hyperspec-symbol-table
           (concat common-lisp-hyperspec-root "Data/Map_Sym.txt"))
     (setq common-lisp-hyperspec-issuex-table
           (concat common-lisp-hyperspec-root "Data/Map_IssX.txt"))))

;; SLIME
;; (load (expand-file-name "~/quicklisp/slime-helper.el"))


(use-package slime
  :init
  (setq slime-lisp-implementations
	'((sbcl ("/usr/local/bin/sbcl") :coding-system utf-8-unix)
	  (ccl ("/usr/local/bin/ccl64"))))
  :config
  (slime-setup  '(slime-repl slime-asdf slime-fancy slime-banner))
  (show-paren-mode t)
  (global-set-key "\C-cs" 'slime-selector)
  ;; Swap square brackets and parentheses in SLIME
  (define-key slime-mode-map (kbd "[") (lambda () (interactive) (insert "(")))
  (define-key slime-mode-map (kbd "]") (lambda () (interactive) (insert ")")))
  (define-key slime-mode-map (kbd "(") (lambda () (interactive) (insert "[")))
  (define-key slime-mode-map (kbd ")") (lambda () (interactive) (insert "]")))
  
  (define-key slime-repl-mode-map (kbd "[") (lambda () (interactive) (insert "(")))
  (define-key slime-repl-mode-map (kbd "]") (lambda () (interactive) (insert ")")))
  (define-key slime-repl-mode-map (kbd "(") (lambda () (interactive) (insert "[")))
  (define-key slime-repl-mode-map (kbd ")") (lambda () (interactive) (insert "]")))

  (define-key slime-mode-map  (kbd "C-<tab>") 'slime-complete-symbol)
  (define-key slime-repl-mode-map  (kbd "C-<tab>") 'slime-complete-symbol))
  
  

;; ;;; Scheme
;; (require 'quack)
;; ;(require 'xscheme)
;; (setq scheme-program-name "scheme")
;; (defun scheme-key-remap (map)
;;   (define-key scheme-mode-map (kbd "[") (lambda () (interactive) (insert "(")))
;;   (define-key scheme-mode-map (kbd "]") (lambda () (interactive) (insert ")")))
;;   (define-key scheme-mode-map (kbd "(") (lambda () (interactive) (insert "[")))
;;   (define-key scheme-mode-map (kbd ")") (lambda () (interactive) (insert "]"))))

;; (add-hook 'scheme-mode-hook (lambda ()
;;                               (scheme-key-remap scheme-mode-map)))
;; (add-hook 'scheme-interaction-mode-hook (lambda ()
;;                                           (scheme-key-remap scheme-interaction-mode-hook)))


;;; Elisp
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;;; Clojure
(use-package cider
  :config
  (add-hook 'clojure-mode 'paredit-mode))

