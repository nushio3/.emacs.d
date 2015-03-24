;; Org-mode shortcut keys.
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)


;; capture templates
(setq org-capture-templates
      '(("p" "Project Task" entry (file+headline (expand-file-name "~/nushiolab/org/project.org") "Inbox")
             "** TODO %?\n    %i\n    %a\n    %T")
        ("m" "memo" entry (file (expand-file-name "~/nushiolab/org/note.org"))
             "* %?\n    %i\n    %a\n    %T")))

;; agenda
(setq org-agenda-files (list (expand-file-name "~/nushiolab/org/") (expand-file-name "~/nushiolab/org/gcal/")))
