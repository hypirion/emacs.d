;; Default font - (Seems to work properly)
(if (member "Inconsolata" (font-family-list))
    (set-face-attribute 'default nil :font "Inconsolata-10"))

;; Hickey
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'sanityinc-solarized-light 't)

;; Remove that darn bell sound
(setq visible-bell t)

;; Maximize frame height
(defun set-preferred-size (frame)
  (if window-system
      (set-frame-size frame 80
                      (/ (- (x-display-pixel-height) 54)
                         (frame-char-height)))))
(set-preferred-size (selected-frame))

(add-hook 'after-make-frame-functions 'set-preferred-size)

(provide 'hypirion-x11)
