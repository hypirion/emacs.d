(require 'tuareg)
(require 'merlin)

(let ((opam-share (ignore-errors (car (process-lines "opam" "var" "share")))))
 (when (and opam-share (file-directory-p opam-share))
  (add-to-list 'load-path (expand-file-name "emacs/site-lisp" opam-share))
  (autoload 'merlin-mode "merlin" nil t nil)
  (add-hook 'tuareg-mode-hook 'merlin-mode t)
  (add-hook 'caml-mode-hook 'merlin-mode t)))

(defun hypirion-ocaml-mode-hook ()
  (local-set-key (kbd "M-.") 'merlin-locate)
  (local-set-key (kbd "C-c C-j") 'merlin-locate)
  (local-set-key (kbd "M-*") 'merlin-pop-stack))

(setq merlin-locate-in-new-window 'never)

(add-hook 'merlin-mode-hook #'hypirion-ocaml-mode-hook)

(provide 'hypirion-ocaml)
