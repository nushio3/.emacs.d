;; Org-mode shortcut keys.
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-default-notes-file (concat org-directory "/note.org"))
(setq org-default-notes-file
      (expand-file-name "~/nushiolab/org/note.org"))

(setq org-deadline-warning-days 7)

(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "<home>") (lambda() (interactive)(find-file "~/nushiolab/org/note.org")))
(global-set-key (kbd "<end>") (lambda() (interactive)(find-file "~/nushiolab/org/project.org")))


;; capture templates
(setq org-capture-templates
      '(("p" "Project Inbox" entry (file+headline (expand-file-name "~/nushiolab/org/project-inbox.org") "Inbox")
             "** TODO %?\n    %i\n    %a\n    %T")
        ("n" "note" entry (file (expand-file-name "~/nushiolab/org/note.org"))
             "* %?\n    %i\n    %a\n    %T")))

;; agenda
(setq org-agenda-files (list (expand-file-name "~/nushiolab/org/") (expand-file-name "~/nushiolab/org/gcal/")))
