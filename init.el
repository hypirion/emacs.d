(defun screen-width nil -1)

(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Never ever have tabs
(setq-default indent-tabs-mode nil)

(setq sentence-end-double-space nil)
(setq-default tab-width 2)
(setq column-number-mode t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; put paths onto load path to load *.el files from them
 (add-to-list 'load-path "~/.emacs.d/hypirion/")

;; ELPA
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source))
(package-initialize)

(defvar my-packages
  '(clojure-mode ac-nrepl nrepl paredit erlang auto-complete
                 gnuplot highlight-parentheses magit go-mode
                 fill-column-indicator tuareg))

(dolist (p my-packages)
  (when (not (package-installed-p p))
      (package-install p)))

(dolist (file '(hypirion-defuns
                hypirion-parens
                hypirion-c
                hypirion-clisp
                hypirion-clj
                hypirion-elisp
                hypirion-erlang
                hypirion-go
                hypirion-haskell
                hypirion-julia
                hypirion-latex
                hypirion-magit
                hypirion-parse
                hypirion-scheme
                hypirion-text
                hypirion-x11))
  (require file))
