(require 'groovy-mode)
(require 'groovy-imports)

(when nil
  (groovy :variables
          groovy-backend 'lsp
          groovy-lsp-jar-path "~/.local/share/groovy-lsp/libs/groovy-language-server-all.jar") )

(provide 'hypirion-groovy)
