;; Default font - (Seems to work properly)
(if (member "Inconsolata" (font-family-list))
    (set-face-attribute 'default nil :font "Inconsolata-12"))

;; Zenburn
(load-theme 'zenburn t)

;; Remove that darn bell sound
(setq visible-bell t)

;; Maximize frame height
(defun set-preferred-size (frame)
  (if window-system
      (set-frame-size frame 80
                      (/ (- (x-display-pixel-height) 55)
                         (frame-char-height)))))
(set-preferred-size (selected-frame))

(add-hook 'after-make-frame-functions 'set-preferred-size)

(require 'windmove)
(windmove-default-keybindings 'super)

(provide 'hypirion-x11)
