;;; Haskell
(use-package haskell-mode
  :config
  (require 'haskell-interactive-mode)
  (require 'haskell-process)

  ;; Indents
  (setq haskell-indent-offset 4)
  (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

  (setq haskell-process-type 'stack-ghci
        haskell-process-args-stack-ghci '("--ghci-options=-ferror-spans")))

