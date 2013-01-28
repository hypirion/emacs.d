;; paredit
(require 'paredit)

;; Highlight Parens
(require 'highlight-parentheses)
(hl-paren-set 'hl-paren-colors
	      '("green2" "yellow" "darkorange1" "red1" "magenta2"
                "purple" "dodgerblue2" "cyan2" "springgreen2"))

;; Shiny parens all the time
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(provide 'hypirion-parens)
