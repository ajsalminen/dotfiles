(add-hook 'php-mode-hook 'hideshowvis-minor-mode)
(add-hook 'js2-mode-hook 'hideshowvis-minor-mode)
(add-hook 'python-mode-hook 'hideshowvis-minor-mode)

;; From http://code.google.com/p/my-dot-emacs-files/source/browse/trunk/.emacs.d/.emacs24/plugins/setup.hideshowvis.el
(defvar hs:all-hide nil "Current state of hideshow for toggling all.")

(defun hs:all-toggle-hiding () "Toggle hideshow all."
  (interactive)
  (setq hs:all-hide (not hs:all-hide))
  (if hs:all-hide
      (hs-hide-all)
    (hs-show-all)))
