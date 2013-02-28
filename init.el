
(add-to-list 'load-path "~/.emacs.d/cedet-1.1/common")
(load-file "~/.emacs.d/cedet-1.1/common/cedet.el")

(add-to-list 'load-path "~/.emacs.d/jdee-2.4.0.1/lisp")
(autoload 'jde-mode "jde" "JDE mode." t)
(setq auto-mode-alist
      (append '(("\\.java\\'" . jde-mode)) auto-mode-alist))
(defun screen-width nil -1)
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

;; Manual config goes here somehow. Should work out of the box.
(setq jde-global-classpath '("/usr/lib/jvm/java-6-openjdk-amd64/jre/lib/"))
(setq jde-jdk-registry '(("1.6.0_24" . "/usr/lib/jvm/java-6-openjdk-amd64/")))

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

(setq sentence-end-double-space nil)
(setq-default tab-width 2)
(setq column-number-mode t)
(define-key global-map (kbd "RET") 'newline-and-indent)

;; put paths onto load path to load *.el files from them
(add-to-list 'load-path "~/.emacs.d/")

;; ELPA
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")))
  (add-to-list 'package-archives source))
(package-initialize)

(defvar my-packages
  '(clojure-mode ac-nrepl nrepl paredit zenburn-theme erlang auto-complete
                 gnuplot highlight-parentheses magit go-mode fill-column-indicator))

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
                hypirion-magit
                hypirion-text
                hypirion-x11))
  (require file))
