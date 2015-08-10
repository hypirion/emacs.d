;; Well, that wasn't hard.
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(add-hook 'before-save-hook 'gofmt-before-save)


(provide 'hypirion-go)
