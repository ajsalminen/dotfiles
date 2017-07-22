;; turn off welcome screen
(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(setq max-specpdl-size 2680)
(setq max-lisp-eval-depth 10000)
;; This should presumably help with helm performance
;; https://news.ycombinator.com/item?id=11100341
(setq gc-cons-threshold 100000000)

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

(add-to-list 'load-path "~/.emacs.d/ansible-runner")
(add-to-list 'load-path "~/.emacs.d/helm-fasd")


(load-user-file "~/.emacs.d/split_config/packages.el")


(require 'ansible-runner)
(require 'php-mode)
(require 'smartparens-config)
(require 'jump-char)
(require 'unbound)
(require 'ansible-runner)
(require 'expand-region)
(require 'keyfreq)
(require 'auto-complete-config)

;;(require 'speedbar)

(speedbar-add-supported-extension ".module")
(speedbar-add-supported-extension ".info")

;; smart mode line
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'respectful)
(sml/setup)

(setq-default save-place t)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(global-auto-complete-mode t)
(add-to-list 'ac-sources 'ac-source-gtags)
(add-to-list 'ac-modes 'yaml-mode)

;; Hack similar to this for php-mode and dash.
;; http://superuser.com/questions/542531/emacs-auto-complete-behavior-with-underscores-in-python-mode
(modify-syntax-entry ?- "_" php-mode-syntax-table)

(load-user-file "split_config/misc.el")
(load-user-file "split_config/todotxt.el")
(load-user-file "split_config/programming.el")
(load-user-file "split_config/selector.el")
(load-user-file "helm-fzf/helm-fzf.el")
(load-user-file "split_config/org.el")
(load-user-file "split_config/hideshow.el")
(load-user-file "split_config/settings.el")
(load-user-file "split_config/snippets.el")
(load-user-file "split_config/helm-gtags.el")
(load-user-file "split_config/helm-dash.el")
(load-user-file "split_config/geben.el")
(load-user-file "split_config/compilation.el")
(load-user-file "split_config/mail.el")
(load-user-file "split_config/ediff.el")
(load-user-file "split_config/keybinds.el")

;; (require 'eclim)
;; (global-eclim-mode)
;; add the emacs-eclim source
;; (require 'ac-emacs-eclim-source)
;; (ac-emacs-eclim-config)

;; Must be after custom-set-variables to work.
;;(load-theme 'cyberpunk t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.

 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#FAF9F8" "#dc322f" "#859900" "#b58900" "#268BD2" "#d33682" "#00877C" "#000000"])
 '(c-default-style
   (quote
    ((drupal-mode . "drupal")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "drupal"))))
 '(custom-enabled-themes (quote (smart-mode-line-respectful)))
 '(custom-safe-themes
   (quote
    ("f0a99f53cbf7b004ba0c1760aa14fd70f2eabafe4e62a2b3cf5cabae8203113b" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "c5a044ba03d43a725bd79700087dea813abcb6beb6be08c7eb3303ed90782482" "756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" "3a727bdc09a7a141e58925258b6e873c65ccf393b2240c51553098ca93957723" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "fc5fcb6f1f1c1bc01305694c59a1a861b008c534cae8d0e48e4d5e81ad718bc6" "1e7e097ec8cb1f8c3a912d7e1e0331caeed49fef6cff220be63bd2a6ba4cc365" "968d1ad07c38d02d2e5debffc5638332696ac41af7974ade6f95841359ed73e3" "9bac44c2b4dfbb723906b8c491ec06801feb57aa60448d047dbfdbd1a8650897" "085b401decc10018d8ed2572f65c5ba96864486062c0a2391372223294f89460" default)))
 '(debug-on-error nil)
 '(delete-selection-mode t)
 '(ergoemacs-mode-used "5.8.0")
 '(ergoemacs-theme "ajsalminen")
 '(fci-rule-color "#F2F2F2")
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-tail-colors
   (quote
    (("#F2F2F2" . 0)
     ("#B4C342" . 20)
     ("#69CABF" . 30)
     ("#6DA8D2" . 50)
     ("#DEB542" . 60)
     ("#F2804F" . 70)
     ("#F771AC" . 85)
     ("#F2F2F2" . 100))))
 '(icicle-mode nil)
 '(menu-bar-mode nil)
 '(org-CUA-compatible nil)
 '(org-replace-disputed-keys nil)
 '(recentf-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil))))
 '(which-func ((t (:foreground "plum1")))))
