(defun maybe-bsd-style ()
  (when (and buffer-file-name
             (string-match "dlchip-aics" buffer-file-name))
    (progn (c-set-style "bsd")
           (setq c-basic-offset 2)
           (c-set-offset 'substatement-open 0)
           )
    ))
(add-hook 'c++-mode-hook 'maybe-bsd-style)
