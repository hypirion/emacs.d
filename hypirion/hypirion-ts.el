(require 'tide)
(require 'web-mode)
(require 'js2-mode)
(require 'prettier-js)
;; Be sure to do 'npm install -g typescript tern prettier' to get this working.

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

(setq company-tooltip-align-annotations t)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'tide-mode-hook 'prettier-js-mode)

;; TSX

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript-tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; JS
(add-hook 'js2-mode-hook #'setup-tide-mode)
;; configure javascript-tide checker to run after your default javascript checker
(flycheck-add-next-checker 'javascript-eslint 'javascript-tide 'append)

;; JSX

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "jsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; configure jsx-tide checker to run after your default jsx checker
(flycheck-add-mode 'javascript-eslint 'web-mode)
(flycheck-add-next-checker 'javascript-eslint 'jsx-tide 'append)

(defun hypirion-ts-mode-hook ()
  ;; I never really use this one but I sat it up for Go mode. Guess I'll get out
  ;; of the habit of using C-c C-j
  (local-set-key (kbd "M-.") 'tide-jump-to-definition)

  (local-set-key (kbd "C-c C-j") 'tide-jump-to-definition)
  (local-set-key (kbd "M-*") 'pop-tag-mark)

  ;; This one is typically not useful, but aliases and docstring stuff
  ;; automatically pops up quite quickly in projects, so w.e.
  (local-set-key (kbd "C-c C-d") 'tide-documentation-at-point))

(add-hook 'tide-mode-hook #'hypirion-ts-mode-hook)


(setq typescript-indent-level 2)


(provide 'hypirion-ts)
