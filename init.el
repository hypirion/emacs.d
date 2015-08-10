(defun screen-width nil -1)

(setq magit-last-seen-setup-instructions "1.4.0")
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

;; Fixup path env as zsh and emacs apparently can't dance together.
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode
                              horizontal-scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Never ever have tabs
(setq-default indent-tabs-mode nil)

(setq sentence-end-double-space nil)
(setq-default tab-width 2)
(setq column-number-mode t)
(setq make-backup-files nil)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; put paths onto load path to load *.el files from them
(add-to-list 'load-path "~/.emacs.d/hypirion/")

;; ELPA
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source))
(package-initialize)

(defvar my-packages
  '(clojure-mode ac-nrepl nrepl paredit erlang auto-complete haskell-mode
                 shm ghc gnuplot highlight-parentheses magit go-mode
                 tuareg))

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

(put 'upcase-region 'disabled nil)
