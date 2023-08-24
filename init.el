(set-background-color "gray19")

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

;; MELPA
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar my-packages
  '(paredit company company-go shm gnuplot
            elm-mode highlight-parentheses magit go-mode tuareg rustic
            company gruvbox-theme exec-path-from-shell projectile ivy
            lsp-mode tide web-mode js2-mode flycheck prettier-js use-package))

(package-initialize)

(let ((refreshed-contents nil))
  (dolist (p my-packages)
    (when (not (package-installed-p p))
      (when (not refreshed-contents)
        (setq refreshed-contents t)
        (package-refresh-contents))
      (package-install p))))


(projectile-mode +1)
(ivy-mode)
(define-key projectile-mode-map (kbd "s-o") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c o") 'projectile-command-map)

(dolist (file '(hypirion-defuns
                hypirion-parens
                hypirion-c
                hypirion-elisp
                hypirion-elm
                hypirion-go
                hypirion-js
                hypirion-latex
                hypirion-magit
                hypirion-parse
                hypirion-py
                hypirion-rust
                hypirion-text
                hypirion-ts
                hypirion-x11))
  (require file))

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(when (memq window-system '(mac ns x))
  (setq exec-path-from-shell-arguments '("-l" "-i"))
  ;; Go stuff to make godef and friends happy
  (setq exec-path-from-shell-variables '("PATH" "MANPATH" "GOPATH" "GOROOT"))
  (exec-path-from-shell-initialize))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(use-package rustic graphviz-dot-mode gruvbox-theme dockerfile-mode yaml-mode elm-mode racer markdown-mode exec-path-from-shell moe-theme company rust-mode tuareg go-mode magit highlight-parentheses gnuplot shm haskell-mode erlang paredit clojure-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
