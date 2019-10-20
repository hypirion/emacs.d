(defun screen-width nil -1)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq create-lockfiles nil)

(setq magit-last-seen-setup-instructions "1.4.0")
(define-obsolete-function-alias 'make-local-hook 'ignore "21.1")

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
(dolist (source '(("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (add-to-list 'package-archives source))

(defvar my-packages
  '(clojure-mode paredit erlang auto-complete haskell-mode shm ghc gnuplot
                 elm-mode highlight-parentheses magit go-mode tuareg rust-mode company
                 moe-theme exec-path-from-shell))

(package-initialize)
(let ((refreshed-contents nil))
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (when (not refreshed-contents)
        (setq refreshed-contents t)
        (package-refresh-contents))
      (package-install p))))

(dolist (file '(hypirion-defuns
                hypirion-parens
                hypirion-c
                hypirion-clisp
                hypirion-clj
                hypirion-elisp
                hypirion-elm
                ;;hypirion-erlang
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
(put 'downcase-region 'disabled nil)

(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-arguments '("-l" "-i"))
  ;; Go stuff to make godef and friends happy
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH" "GOROOT"))
  (exec-path-from-shell-initialize))
