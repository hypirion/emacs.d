;; paredit
(require 'paredit)

;; setup splice-sexp-killing-forward
(define-key paredit-mode-map (kbd "M-n") 'paredit-splice-sexp-killing-forward)
(define-key paredit-mode-map (kbd "M-p") 'paredit-splice-sexp-killing-backward)

;; We're professionals and won't allow arrow keys
(define-key paredit-mode-map (kbd "C-<right>") nil)
(define-key paredit-mode-map (kbd "C-<left>") nil)
(define-key paredit-mode-map (kbd "M-<down>") nil)
(define-key paredit-mode-map (kbd "M-<up>") nil)

;; Highlight Parens
(require 'highlight-parentheses)
(hl-paren-set 'hl-paren-colors
	      '("red1" "magenta2" "purple" "dodgerblue2" "cyan2" "springgreen2"
          "green2" "yellow" "darkorange1"))

;(set-face-attribute 'hl-paren-face nil :weight 'bold)

;; Shiny parens all the time
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))
(global-highlight-parentheses-mode t)

(provide 'hypirion-parens)
