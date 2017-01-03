;; Wrap text lines which exceed 80 characters.
(setq-default fill-column 80)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; Kill marked area
(delete-selection-mode 1)

(defun move-text-internal (arg)
  (cond
   ((and mark-active transient-mark-mode)
    (if (> (point) (mark))
        (exchange-point-and-mark))
    (let ((column (current-column))
          (text (delete-and-extract-region (point) (mark))))
      (forward-line arg)
      (move-to-column column t)
      (set-mark (point))
      (insert text)
      (exchange-point-and-mark)
      (setq deactivate-mark nil)))
   (t
    (let ((column (current-column)))
      (beginning-of-line)
      (when (or (> arg 0) (not (bobp)))
        (forward-line)
        (when (or (< arg 0) (not (eobp)))
          (transpose-lines arg))
        (forward-line -1))
      (move-to-column column t)
      (indent-for-tab-command)))))

(defun move-text-down (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines down."
  (interactive "*p")
  (move-text-internal arg))

(defun move-text-up (arg)
  "Move region (transient-mark-mode active) or current line
  arg lines up."
  (interactive "*p")
  (move-text-internal (- arg)))

(global-set-key (kbd "M-s-p") 'move-text-up)
(global-set-key (kbd "M-s-n") 'move-text-down)

;; Add DOING and CANCELLED as org-mode-elements
(setq org-todo-keywords
      '((sequence "TODO" "DOING" "|" "DONE" "CANCELLED")))

(setq org-todo-keyword-faces
      '(("DOING" . (:foreground "goldenrod" :weight bold))
	("CANCELLED" . (:foreground "dark green" :background "seashell"
				    :weight bold))))

;; Setup markdown mode when entering .md-files
(autoload 'markdown-mode "markdown-mode" "Markdown Mode." t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(defun magit-fill-column ()
  (setq fill-column 72))

(add-hook 'magit-log-edit-mode-hook 'magit-fill-column)

;; hook in gnuplot mode when editing
(require 'gnuplot)
(add-to-list 'auto-mode-alist '("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode))

;; em dash to the rescue!
(global-set-key (kbd "M--") (lambda () (interactive) (insert "—")))

;; Highlight column 80
(require 'whitespace)
(setq whitespace-line-column 80) ;; todo: set this to fill-column size
(setq whitespace-style '(tabs tab-mark face trailing lines-tail))
(setq whitespace-tab 'hypirion-whitespace-tab)

(defface hypirion-whitespace-tab
  '((((class color) (background dark))
     (:foreground "grey25"))
    (((class color) (background light))
     (:foreground "lightgray"))
    (t (:inverse-video t)))
  "Just lighter colour on tabs")

(global-whitespace-mode)

(provide 'hypirion-text)
