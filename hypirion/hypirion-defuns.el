(defun lambda-as-lambda (mode pattern)
  (font-lock-add-keywords
   mode `((,pattern
           (0 (progn (compose-region (match-beginning 1) (match-end 1)
                                     "λ" 'decompose-region)))))))

(dolist (kbd-str '("<left>" "<right>" "<up>" "<down>" "<C-left>" "<C-right>"
                   "<C-up>" "<C-down>" "<M-left>" "<M-right>" "<M-up>"
                   "<M-down>" "C-x C-s" "C-x C-f" "C-x C-v" "C-g" "C-x o" "C-x b"))
  (eval `(global-unset-key (kbd ,kbd-str))))

(global-set-key (kbd "<up>") (lambda () (interactive) (scroll-down 1)))
(global-set-key (kbd "<down>") (lambda () (interactive) (scroll-up 1)))
(global-set-key (kbd "s-d") 'delete-backward-char)

(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-f") 'find-file)
(global-set-key (kbd "s-v") 'find-alternate-file)
(global-set-key (kbd "s-g") 'keyboard-escape-quit)
(global-set-key (kbd "s-o s-o") 'other-window)
(global-set-key (kbd "M-s-b") 'ivy-switch-buffer) ;; really M-s-b

(provide 'hypirion-defuns)
