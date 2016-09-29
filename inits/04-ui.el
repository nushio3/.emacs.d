(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(global-linum-mode t)
(setq linum-format "%4d ")
(column-number-mode t)

(add-hook 'org-mode-hook (lambda () (linum-mode -1))) ; disable linum in org-mode

(mapc                                   ;; 以下flyspell-modeの設定
 (lambda (hook)
   (add-hook hook 'flyspell-prog-mode))
 '(
   c-mode-common-hook                 ;; ここに書いたモードではコメント領域のところだけ
   emacs-lisp-mode-hook                 ;; flyspell-mode が有効になる
   ))
(mapc
   (lambda (hook)
     (add-hook hook
                      '(lambda () (flyspell-mode 1))))
   '(
     latex-mode-hook     ;; ここに書いたモードでは
                                    ;; flyspell-mode が有効になる
     ))
