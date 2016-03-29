(add-to-list 'auto-mode-alist '("\\.\\(module\\|test\\|install\\|theme\\|engine\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.\\(php\\|inc\\)$" . php-mode))
(add-to-list 'auto-mode-alist '("\\.info" . conf-windows-mode))
(add-to-list 'auto-mode-alist '("\\.j2" . jinja2-mode))


(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'highlight-indentation-current-column-mode)
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'smartparens-mode)
(add-hook 'prog-mode-hook 'which-func-mode)
(add-hook 'prog-mode-hook
          (lambda ()
	    (add-to-list 'ac-sources 'ac-source-gtags)
            (local-set-key (kbd "ö") ";")))

(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)
             (ansible 1)
             (add-to-list 'ac-sources 'ac-source-dictionary)))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(add-hook 'php-mode-hook 'turn-on-eldoc-mode)
(add-hook 'python-mode-hook 'turn-on-eldoc-mode)


(global-aggressive-indent-mode 1)
(add-to-list 'aggressive-indent-excluded-modes 'html-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(add-hook 'after-init-hook #'global-flycheck-mode)
(setq flycheck-phpcs-standard "Drupal")

(defun return-autoindent () "Automatically indent lines on newline."
  () (local-set-key (kbd "M-v") 'reindent-then-newline-and-indent))

(add-hook 'php-mode-hook 'return-autoindent)
(add-hook 'js2-mode-hook 'return-autoindent)
(add-hook 'python-mode-hook 'return-autoindent)


(define-globalized-minor-mode global-fci-mode fci-mode (lambda () (fci-mode 1)))
(global-fci-mode 1)
