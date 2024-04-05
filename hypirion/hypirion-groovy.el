(require 'groovy-mode)
(require 'groovy-imports)

(setq lsp-groovy-server-file "~/.local/share/groovy-lsp/libs/groovy-language-server-all.jar")
(add-hook 'groovy-mode-hook #'lsp-deferred)

(provide 'hypirion-groovy)
