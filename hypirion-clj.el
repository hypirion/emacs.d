(require 'clojure-mode)

(define-key clojure-mode-map (kbd "RET") 'newline-and-indent)

(dolist (mode '(clojure-mode-hook nrepl-mode-hook))
  (add-hook mode 'enable-paredit-mode))

(define-clojure-indent
  (defroutes 'defun)
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

(require 'ac-nrepl)
(add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
(add-hook 'clojure-nrepl-mode-hook 'ac-nrepl-setup)
(eval-after-load "auto-complete"
  '(add-to-list 'ac-modes 'nrepl-mode))

;; Fix nRepl keybindings which override paredit's
(add-hook 'clojure-mode-hook
          (lambda () (define-key clojure-mode-map (kbd "DEL")
                  'paredit-backward-delete)))
;; Fix nrepl's input movement
(add-hook 'clojure-nrepl-mode-hook
          (lambda ()
            (define-key nrepl-mode-map (kbd "M-N")
              'nrepl-next-input)
            (define-key nrepl-mode-map (kbd "M-P")
              'nrepl-previous-input)))

(provide 'hypirion-clj)
