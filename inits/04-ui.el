(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode t)
(setq linum-format "%4d ")
(column-number-mode t)

(add-hook 'org-mode-hook (lambda () (linum-mode -1))) ; disable linum in org-mode
