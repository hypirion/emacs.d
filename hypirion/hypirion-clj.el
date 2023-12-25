(require 'clojure-mode)
(require 'paredit)

(add-hook 'clojure-mode-hook #'paredit-mode)

(provide 'hypirion-clj)
