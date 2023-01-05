;; Default font - (Seems to work properly)
(set-face-attribute 'default nil :font "comiccode-21")


;; Hickey
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")


(setq hypirion-x11-previous-theme nil)
(defun hypirion-x11-synchronise-theme ()
  (let* ((h (string-to-number
             (substring (current-time-string) 11 13)))
         (next-theme (if (<= 7 h 19)
                         'gruvbox-light-hard
                       'gruvbox-dark-hard)))
    (when (not (equal hypirion-x11-previous-theme next-theme))
      (load-theme next-theme t)
      (setq hypirion-x11-previous-theme next-theme))))

(run-with-timer 0 60 #'hypirion-x11-synchronise-theme)

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
