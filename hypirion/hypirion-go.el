;; Well, that wasn't hard.
(require 'go-autocomplete)
(require 'auto-complete-config)
(require 'go-mode)
(require 'golint)

(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)


(defun hypirion-go-mode-hook ()
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark))

(add-hook 'go-mode-hook 'hypirion-go-mode-hook)

(defun golint-after-save-hook ()
  (when (eq major-mode 'go-mode)
    (golint)))
(add-hook 'after-save-hook 'golint-after-save-hook)

(setq compilation-exit-message-function
      (lambda (status code msg)
        (when (and (eq status 'exit) (zerop code))
          (let ((compilation-buffer-name (golint-buffer-name nil)))
            (bury-buffer compilation-buffer-name)
            (delete-window (get-buffer-window (get-buffer compilation-buffer-name)))))
        ;; Always return the anticipated result of compilation-exit-message-function
        (cons msg code)))

(provide 'hypirion-go)
