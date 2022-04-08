(require 'go-mode)
(require 'lsp-mode)


(defun hypirion-go-mode-hook ()
                                        ; Override godef key bindings
  (local-set-key (kbd "C-c C-d") 'lsp-describe-thing-at-point)
  (local-set-key (kbd "M-.") 'lsp-find-definition)
  (local-set-key (kbd "C-c C-j") 'lsp-find-definition)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(add-hook 'go-mode-hook #'hypirion-go-mode-hook)
(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'hypirion-go)
