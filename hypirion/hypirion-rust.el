(require 'rust-mode)
;(require 'rustfmt)
(require 'company)

;(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

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
(setq company-tooltip-align-annotations t)

(provide 'hypirion-rust)
