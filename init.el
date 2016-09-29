;; Instructions.
;;
;; Type
;;   M-x package-refresh-contents
;; When you see a ``Package not found'' error.


;; ~/.emacs.d/site-lisp 以下全部読み込み
(let ((default-directory (expand-file-name "~/.emacs.d/site-lisp")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'init-loader)
(setq init-loader-show-log-after-init nil)
(init-loader-load "~/.emacs.d/inits")


;; packages to install
(defvar my/packages
  '(anything
    auto-complete
    powerline
    quickrun
    haskell-mode
    shm
    ghc
    markdown-mode
    flymake
    flymake-cursor
    flycheck
    magit
    idris-mode
    markdown-mode
    review-mode
    )
  "A list of packages to install from MELPA at launch.")


;; init package.el
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

;; install packages
(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))

;; load init scripts
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
(setq init-loader-show-log-after-init t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-compile-cabal-build-command "cd %s && stack build --ghc-options=-ferror-spans")
 '(inhibit-startup-screen t)
 '(org-enforce-todo-dependencies t)
 '(package-selected-packages
   (quote
    (rust-mode multi-web-mode web-mode mew review-mode idris-mode magit flycheck flymake-cursor markdown-mode ghc shm haskell-mode quickrun powerline auto-complete anything))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; (server-start) ;; start emacs server


;;;; '(org-agenda-sorting-strategy
;;;;   (quote
;;;;    ((agenda habit-down timestamp-down priority-down category-keep)
;;;;     (todo deadline-down)
;;;;     (tags priority-down category-keep)
;;;;     (search category-keep))))
;;;;
