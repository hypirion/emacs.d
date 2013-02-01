;; Fixup path env as zsh and emacs apparently can't dance together.
(let ((path (shell-command-to-string ". ~/.zshrc; echo -n $PATH")))
  (setenv "PATH" path)
  (setq exec-path
        (append
         (split-string-and-unquote path ":")
         exec-path)))

(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode))
  (when (fboundp mode) (funcall mode -1)))

;; Remove splash screen
(setq inhibit-splash-screen t)

;; Never ever have tabs
(setq-default indent-tabs-mode nil)

;; Turn on column number mode
(setq column-number-mode t)

;; put paths onto load path to load *.el files from them
(add-to-list 'load-path "~/.emacs.d/")

;; ELPA
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source))
(package-initialize)

(dolist (file '(hypirion-defuns
                hypirion-parens
                hypirion-c
                hypirion-clisp
                hypirion-clj
                hypirion-elisp
                hypirion-magit
                hypirion-text
                hypirion-x11))
  (require file))
