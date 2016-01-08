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
  '(clojure-mode paredit erlang auto-complete haskell-mode shm ghc gnuplot
                 highlight-parentheses magit go-mode tuareg))

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
                hypirion-rust
                hypirion-scheme
                hypirion-text
                hypirion-x11))
  (require file))

(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote cabal-repl))
 '(package-selected-packages
   (quote
    (company racer cargo flymake-rust rustfmt rust-mode toml-mode cider markdown-mode tuareg shm paredit magit highlight-parentheses go-mode gnuplot ghc erlang color-theme-sanityinc-solarized clojure-mode auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
