(require 'clojure-mode)

(define-key clojure-mode-map (kbd "RET") 'newline-and-indent)

(dolist (mode '(clojure-mode-hook))
  (add-hook mode 'enable-paredit-mode))

(define-clojure-indent
  (defroutes 'defun)
  (defspec 'defun)
  (for-all 1)
  (GET 2)
  (POST 2)
  (PUT 2)
  (DELETE 2)
  (HEAD 2)
  (ANY 2)
  (context 2))

(lambda-as-lambda 'clojure-mode "(\\(\\<fn\\>\\)")

;; Auto-completion for Clojure
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict")
(ac-config-default)

(provide 'hypirion-clj)
