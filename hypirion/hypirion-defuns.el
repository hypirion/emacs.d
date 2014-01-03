(defun lambda-as-lambda (mode pattern)
  (font-lock-add-keywords
   mode `((,pattern
           (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                     "λ" 'decompose-region)))))))

(dolist (kbd-str '("<left>" "<right>" "<up>" "<down>" "<C-left>" "<C-right>"
                   "<C-up>" "<C-down>" "<M-left>" "<M-right>" "<M-up>"
                   "<M-down>"))
  (eval `(global-unset-key (kbd ,kbd-str))))

(provide 'hypirion-defuns)
