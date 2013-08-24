(require 'erlang)

(add-to-list 'auto-mode-alist '("\\.erl\\'" . erlang-mode))

;; Fix erlang's enter key
(add-hook 'erlang-mode-hook
          (lambda ()
            (define-key erlang-mode-map (kbd "RET") 'newline-and-indent)))

(provide 'hypirion-erlang)


















