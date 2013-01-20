;; Default font - (Seems to work properly)
(set-face-attribute 'default "Inconsolata-13")

;; Solarized light
(load-theme 'solarized-light t)

;; Remove that darn bell sound
(setq visible-bell t)

;; Maximize frame size
(defun set-preferred-size (frame)
  (if window-system
      (set-frame-size frame 80 72)))
;; TODO - make 72 some value which suits nicely for any window

(set-preferred-size (selected-frame))

(add-hook 'after-make-frame-functions 'set-preferred-size)

(provide 'hypirion-x11)
