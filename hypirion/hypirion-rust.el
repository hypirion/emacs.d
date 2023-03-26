(require 'rustic)

(use-package rustic
  :ensure
  :bind (:map rustic-mode-map
              ("M-j" . lsp-ui-imenu)
              ("M-?" . lsp-find-references)
              ("C-c C-c l" . flycheck-list-errors)
              ("C-c C-c a" . lsp-execute-code-action)
              ("C-c C-c r" . lsp-rename)
              ("C-c C-c q" . lsp-workspace-restart)
              ("C-c C-c Q" . lsp-workspace-shutdown)
              ("C-c C-c s" . lsp-rust-analyzer-status)
              ("C-c C-d"  . lsp-describe-thing-at-point)
              ("M-." . lsp-find-definition)
              ("C-c C-j" . lsp-find-definition)
              ("M-*" . pop-tag-mark))
  :config
  ;; uncomment for less flashiness
  ;; (setq lsp-eldoc-hook nil)
  ;; (setq lsp-enable-symbol-highlighting nil)
  ;; (setq lsp-signature-auto-activate nil)

  ;; comment to disable rustfmt on save
  (setq rustic-format-on-save t))

(when nil

 (defun hypirion-rust-indent-or-complete-common ()
   "Indent the current line or region, or complete the common part."
   (interactive)
   (cond
    ((use-region-p)
     (indent-region (region-beginning) (region-end)))
    ((let ((old-point (point))
           (old-tick (buffer-chars-modified-tick))
           (tab-always-indent t))
       (call-interactively #'indent-for-tab-command)
       (when (and (eq old-point (point))
                  (eq old-tick (buffer-chars-modified-tick)))
         (company-complete-common))))))

 (define-key rust-mode-map (kbd "TAB") #'hypirion-rust-indent-or-complete-common)
 (setq company-tooltip-align-annotations t))

(provide 'hypirion-rust)
