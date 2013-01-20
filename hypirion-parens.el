;; paredit
(require 'paredit)

;; Highlight Parens
(require 'highlight-parentheses)
(hl-paren-set 'hl-paren-colors
	      '("red1" "magenta2" "purple" "dodgerblue2" "cyan2" "springgreen2"
		"green2" "yellowgreen" "darkorange1" "orangered1"))

;; Shiny parens all the time
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(provide 'hypirion-parens)
