;;; LaTeX
(use-package tex
  :defer t
  :ensure auctex
  :config
  (setq TeX-auto-save t
        TeX-parse-self t
        TeX-save-query nil)
  (setq-default TeX-master nil)
  (setq-default TeX-PDF-mode t)
  (setq-default TeX-engine 'luatex)
  (setq-default TeX-source-correlate-mode t)

  (add-hook 'TeX-mode-hook
            (lambda ()
              (progn
                (turn-on-reftex)
                (visual-line-mode)
                (LaTeX-math-mode)
                (show-paren-mode)
                (add-to-list 'TeX-view-program-selection '(output-pdf "displayline")))))

  (use-package reftex
    :config
    (setq reftex-plug-into-AUCTeX t)
    (setq reftex-fref-is-default t))

  (use-package flyspell
    :config
    (add-hook 'TeX-mode-hook
              (lambda ()
                (flyspell-mode)))))

