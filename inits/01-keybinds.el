(global-set-key "\C-t" 'nil)
(global-set-key "\C-z" 'nil)

(global-set-key "\C-cd" 'flymake-display-err-menu-for-current-line)
(global-set-key "\C-p" 'anything)
(global-set-key [f5] 'quickrun)
(global-set-key "\C-cs" 'haskell-mode-stylish-buffer)
(windmove-default-keybindings 'meta)

(global-set-key (kbd "<M-S-return>") (lambda() (interactive)(shell-command "gnome-terminal --hide-menubar")))


;; Do not use C-x, C-c, C-v as cut, copy, and paste
(setq cua-enable-cua-keys  nil)

(defun become-server ()
  (interactive)
  (progn (message "I am a server")
         (server-start)
         (global-set-key "\C-x\C-c" (lambda()(interactive)(message "Type M-x save-buffers-kill-terminal to quit a server"))  )))
