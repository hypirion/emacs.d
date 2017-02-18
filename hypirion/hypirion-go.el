;; Well, that wasn't hard.
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode)

(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(defun hypirion-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(add-hook 'go-mode-hook 'hypirion-go-mode-hook)


(provide 'hypirion-go)
