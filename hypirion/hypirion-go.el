;; Well, that wasn't hard.
(require 'go-autocomplete)
(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(add-to-list 'ac-modes 'go-mode) ;; Seems broken somehow.

(provide 'hypirion-go)
