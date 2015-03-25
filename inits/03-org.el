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
(global-set-key (kbd "<end>") (lambda() (interactive)(progn (find-file "~/nushiolab/org/project.org") (org-clock-sum) )))


;; capture templates
(setq org-capture-templates
      '(("p" "Project Task" entry (file+headline (expand-file-name "~/nushiolab/org/project.org") "Inbox")
             "** TODO %?\n    %i\n    %a\n    DEADLINE: %^t")
        ("n" "note" entry (file (expand-file-name "~/nushiolab/org/note.org"))
             "* %?\n    %i\n    %a\n    %T")))
;; for format, see http://orgmode.org/manual/Template-expansion.html#Template-expansion


;; agenda
(setq org-agenda-files (list (expand-file-name "~/nushiolab/org/") (expand-file-name "~/nushiolab/org/gcal/")))


;(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")

(setq org-columns-default-format "%38ITEM(Details) %DEADLINE %TAGS(Context) %7TODO(To Do) %6CLOCKSUM(Time){Total}")
; c.f. http://orgmode.org/manual/Special-properties.html
