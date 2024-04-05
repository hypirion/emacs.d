(require 'clojure-mode)
(require 'paredit)
(require 'lsp)

;; TODO: make into global lsp hook I guess
(defun hypirion-clojure-mode-hook ()
                                        ; Override godef key bindings
  (local-set-key (kbd "C-c C-d") 'lsp-describe-thing-at-point)
  (local-set-key (kbd "M-.") 'lsp-find-definition)
  (local-set-key (kbd "C-c C-j") 'lsp-find-definition)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(dolist (m '(clojure-mode-hook
             clojurec-mode-hook
             clojurescript-mode-hook
             clojurex-mode-hook))
  (add-hook m #'paredit-mode)
  (add-hook m 'lsp)
  (add-hook m #'hypirion-clojure-mode-hook))

(dolist (m '(clojure-mode
             clojurec-mode
             clojurescript-mode
             clojurex-mode))
  (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))


(provide 'hypirion-clj)
