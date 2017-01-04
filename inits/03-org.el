;; Org-mode shortcut keys.
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;(setq org-default-notes-file (concat org-directory "/note.org"))
(setq org-default-notes-file
      (expand-file-name "~/Dropbox/org/note.org"))

(setq org-deadline-warning-days 7)

(define-key global-map "\C-cc" 'org-capture)
(global-set-key (kbd "<end>") (lambda() (interactive)(find-file "~/Dropbox/org/note.org")))
(global-set-key (kbd "<insert>") (lambda() (interactive)(find-file "~/Dropbox/org/note.org")))
(global-set-key (kbd "<home>") (lambda() (interactive)(progn (find-file "~/Dropbox/org/project.org") (org-clock-sum) )))


;; capture templates
(setq org-capture-templates
      '(("p" "Project Inbox" entry (file+headline (expand-file-name "~/Dropbox/org/inbox.org") "Inbox")
                      "** TODO %?\n    %i\n    %a\n    %T")
;             "** TODO %?\n    %i\n    %a\n    DEADLINE: %^t")
        ("n" "note" entry (file (expand-file-name "~/Dropbox/org/note.org"))
             "* %?\n    %i\n    %a\n    %T")))
;; for format, see http://orgmode.org/manual/Template-expansion.html#Template-expansion


;; agenda
(setq org-agenda-files (list (expand-file-name "~/Dropbox/org/") (expand-file-name "~/Dropbox/org/gcal/")))


; set the columns in agenda-column view. i.e. C-c a a C-c C-x C-c
; c.f. http://orgmode.org/manual/Special-properties.html
(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")
;(setq org-columns-default-format "%38ITEM(Details) %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")
;(setq org-columns-default-format "%38ITEM(Details) %10DEADLINE %TAGS(Context) %7TODO(To Do) %5Effort(Time){:} %6CLOCKSUM{Total}")

; set the time grid settings (toggle with key "G")
(setq org-agenda-time-grid '((daily today)
                            "----------------"
                            (800 1000 1200 1400 1600 1800 2000)))

; Only one occurrence is shown for each repeating stamp, either today or the nearest into the future.
(setq org-agenda-repeating-timestamp-show-all nil)

; Save the clock history across emacs session
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)



;; Insert the org mode clock into the temp file
(display-time)
(defun esf/org-clocking-info-to-file ()
    (if (org-clock-is-active) (progn
        (with-temp-file "~/.emacs.d/org-mode-status.fifo"
          ;; can be created by shell command "mkfifo org-mode-status.fifo"
        (insert (format "%d(%d)min: %s"
                        (- (org-clock-get-clocked-time) org-clock-total-time)
                        (org-clock-get-clocked-time)
                        ;;                        (org-clock-get-clock-string)
                        ;;                        'org-clock-current-task
                        (eval org-clock-current-task)
                        )
                )
        )
        (with-temp-file "~/.emacs.d/org-mode-status.txt"
          ;; can be created by shell command "mkfifo org-mode-status.fifo"
        (insert (format "%d(%d)min: %s"
                        (- (org-clock-get-clocked-time) org-clock-total-time)
                        (org-clock-get-clocked-time)
                        ;;                        (org-clock-get-clock-string)
                        ;;                        'org-clock-current-task
                        (eval org-clock-current-task)
                        )
                )
        )
        ;;(shell-command "echo '' > ~/.emacs.d/org-mode-status.fifo" )
        (with-temp-buffer (shell-command "echo '' > ~/.emacs.d/org-mode-status.fifo" t )) ;; flush the pipe
        );; progn
    )
    )

(defun esf/org-clear-clocking-info-file ()
  (progn
        (with-temp-buffer (shell-command "echo 'out of clock' > ~/.emacs.d/org-mode-status.fifo" t)) ;; flush the pipe
        (with-temp-buffer (shell-command "echo 'out of clock' > ~/.emacs.d/org-mode-status.txt" t)) ;; flush the pipe
  ))
(add-hook 'display-time-hook 'esf/org-clocking-info-to-file)
(add-hook 'org-clock-in-hook 'esf/org-clocking-info-to-file)
(add-hook 'org-clock-out-hook 'esf/org-clear-clocking-info-file)


;;
(defun org-renumber-deadlines (&optional beg end)             ; foo2は1引数
  (interactive "r")
  (call-process-region beg end "org-renumber-deadlines.py" t t t))
  ;(insert (number-to-string beg) " " (number-to-string end)))
;call-process-region start end program &optional delete destination display &rest args
