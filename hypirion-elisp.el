(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(lambda-as-lambda 'emacs-lisp-mode "(\\(\\<lambda\\>\\)")
(define-key lisp-mode-map (kbd "RET") 'newline-and-indent)

(provide 'hypirion-elisp)
