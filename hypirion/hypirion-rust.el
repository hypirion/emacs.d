(require 'rust-mode)
(require 'racer)
(require 'company)

(setq rust-format-on-save t)

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)

(defun hypirion-rust-mode-hook ()
  (setq racer-rust-src-path
        (string-join (list
                      (string-trim (shell-command-to-string "rustc --print sysroot"))
                      "/lib/rustlib/src/rust/src")))
  (local-set-key (kbd "C-c C-d") 'racer-describe)
  (local-set-key (kbd "C-c C-j") 'racer-find-definition)
  (local-set-key (kbd "M-.") 'racer-find-definition)
  (local-set-key (kbd "M-*") 'pop-tag-mark))


(add-hook 'rust-mode-hook 'hypirion-rust-mode-hook)

(define-key rust-mode-map (kbd "C-c C-c") 'rust-run-clippy)
(define-key rust-mode-map (kbd "C-c C-o") 'rust-compile)


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
