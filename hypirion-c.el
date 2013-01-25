(require 'cc-mode)

(define-key c-mode-base-map (kbd "RET") 'newline-and-indent)
(c-toggle-electric-state 1)
(c-toggle-hungry-state 1)

(defun hypirion-c-mode-insert-brackets ()
  (interactive)
  (insert "{")
  (let ((pps (syntax-ppss)))
    (when (and (eolp) (not (or (nth 3 pps) (nth 4 pps))))
      (c-indent-line)
      (insert "\n\n}")
      (c-indent-line)
      (forward-line -1)
      (c-indent-line))))

(define-key c-mode-base-map "{" 'hypirion-c-mode-insert-brackets)

(provide 'hypirion-c)
