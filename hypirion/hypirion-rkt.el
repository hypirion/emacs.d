(add-hook 'racket-mode-hook 'enable-paredit-mode)
(lambda-as-lambda 'racket-mode "(\\(\\<lambda\\>\\)")

;; guess racket-mode has to define racket-mode-map before this triggers?
(add-hook 'racket-mode-hook
          (lambda ()
            (define-key racket-mode-map (kbd "RET") 'newline-and-indent)))

(require 'racket-xp)
(add-hook 'racket-mode-hook #'racket-xp-mode)


(provide 'hypirion-rkt)
