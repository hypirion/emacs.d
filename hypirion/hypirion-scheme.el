(dolist (mode '(scheme-mode-hook))
  (add-hook mode 'enable-paredit-mode))

(provide 'hypirion-scheme)
