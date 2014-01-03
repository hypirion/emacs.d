(when nil

  ;; Don't load SLIME and stuff normally as it's horribly slow for some strange
  ;; reason (Obviously some TODO)
  (dolist (mode '(lisp-mode-hook slime-repl-mode-hook))
    (add-hook mode 'enable-paredit-mode))

  (load (expand-file-name "~/quicklisp/slime-helper.el"))

  (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
  (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

  (setq inferior-lisp-program "/usr/bin/sbcl"
        lisp-indent-function 'common-lisp-indent-function
        slime-complete-symbol-function 'slime-fuzzy-complete-symbol
        slime-startup-animation nil)

  ;; Stop SLIME's REPL from grabbing DEL,
  ;; which is annoying when backspacing over a '('
  (defun override-slime-repl-bindings-with-paredit ()
    (define-key slime-repl-mode-map
      (read-kbd-macro paredit-backward-delete-key) nil))
  (add-hook 'slime-repl-mode-hook 'override-slime-repl-bindings-with-paredit)

  (lambda-as-lambda 'lisp-mode "(\\(\\<lambda\\>\\)"))

(provide 'hypirion-clisp)
