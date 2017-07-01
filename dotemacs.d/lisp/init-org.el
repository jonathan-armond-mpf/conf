;;; Org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-directory "~/org")
(setq org-mobile-inbox-for-pull "~/org/flagged.org")
(setq org-mobile-directory "~/Dropbox/Apps/MobileOrg")
;(setq org-agenda-files (list "~/org/calendar.org" "~/org/family.org"))
(setq org-startup-indented t)
(setq org-publish-project-alist
      '(("org"
         :base-directory "~/org/"
         :exclude "emacs.org"
         :publishing-directory "~/Dropbox/black flowers/org"
         :publishing-function org-html-publish-to-html
         :section-numbers nil
         :with-toc t)))
(setq jwa-org-file "~/org/work.org")
;(add-hook 'after-init-hook (lambda () (find-file jwa-org-file)))
;(add-hook 'midnight-hook 'org-publish)

(defun jwa-download-calendar (url org-file)
  (let ((cal-filename (concat temporary-file-directory "org.ics")))
    (url-copy-file url cal-filename t)
    (shell-command (concat "gawk -f /Users/jon/awk/ical2org < " cal-filename " > " org-file))))

;(add-hook 'midnight-hook
;          (lambda ()
;            (progn
;              (jwa-download-calendar "https://www.google.com/calendar/ical/jon.armond%40gmail.com/private-45688031fdf63fa4d8c90dd1d113859f/basic.ics" "~/org/calendar.org")
;              (jwa-download-calendar "https://www.google.com/calendar/ical/elina%40mechanochemistry.org/private-6428d0a6a6545733e89432af3e722692/basic.ics" "~/org/family.org"))))
