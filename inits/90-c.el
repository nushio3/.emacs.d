(defun maybe-bsd-style ()
  (when (and buffer-file-name
             (string-match "dlchip-aics" buffer-file-name))
    (progn (c-set-style "bsd")
           (c-set-offset 'substatement-open 0)
           )
    ))
(add-hook 'c++-mode-hook 'maybe-bsd-style)
