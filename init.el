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

;; Do not use C-x, C-c, C-v as cut, copy, and paste
(setq cua-enable-cua-keys  nil)
