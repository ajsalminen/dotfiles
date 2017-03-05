(defun yaml-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Ansible" )))

(add-hook 'yaml-mode-hook 'yaml-doc)

(defun shell-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Bash" )))

(add-hook 'shell-mode-hook 'shell-doc)

(defun css-html-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("CSS" "HTML" "Twig")))

(add-hook 'css-mode-hook 'css-html-doc)
(add-hook 'html-mode-hook 'css-html-doc)

(defun javascript-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("JavaScript" "jQuery" "jQuery_UI" )))

(add-hook 'js2-mode-hook 'javascript-doc)


(defun latex-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("LaTeX" )))

(add-hook 'latex-mode-hook 'latex-doc)

(defun elisp-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Emacs_Lisp" )))


(defun text-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Markdown" "Nginx")))

(add-hook 'text-mode-hook 'text-doc)


(defun python-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Python_2" "Python_3")))

(defun php-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Drupal_7" "Drupal_8" "PHP" "Symfony" "MySQL")))


(add-hook 'php-mode-hook 'php-doc)
(add-hook 'emacs-lisp-mode-hook 'elisp-doc)
(add-hook 'python-mode-hook 'python-doc)

;; Workaround for this bug: https://github.com/areina/helm-dash/issues/67
(defadvice helm-dash-buffer-local-docsets (before helm-dash-fix-empty-results activate)
  (setq helm-current-buffer (current-buffer)))
