(add-hook 'prog-mode-hook 'helm-gtags-mode)
;; Drupal needs this for gtags to be generated for .inc, .module etc.
(defadvice helm-gtags-update-tags (before gtagslabel-setup activate)
  (if (and (boundp 'drupal-mode) drupal-mode)
      (setenv "GTAGSLABEL" "drupal")
    (setenv "GTAGSLABEL" "default")))
(setq helm-gtags-auto-update t)
