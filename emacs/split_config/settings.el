(setq inhibit-startup-message t)


(setq browse-url-generic-program "google-chrome")
(setq browse-url-browser-function 'browse-url-generic)
(setq browse-url-new-window-flag t)

(setq-default global-font-lock-mode nil)

(setq org-babel-ansible-playbook-command "ansible-playbook -i /home/anttis/projektit/vagrant/vagrant_ansible_dev/inventory")
(setq magit-last-seen-setup-instructions "1.4.0")
;Cache passwords for two hours
(setq password-cache-expiry 7200)

(setq-default fill-column 80)
(setq next-line-add-newlines t)
(setq c-hungry-delete-key t)
'(debug-on-error t)
;; C-k kills whole line and newline if at beginning of line
(setq kill-whole-line t)

;;; backup/autosave
(setq backup-by-copying t)
(setq version-control t)
(setq delete-old-versions t)
(setq kept-old-versions 2)
(setq kept-new-versions 6)

(defvar backup-dir (expand-file-name "~/.emacs.d/backup/"))
(defvar autosave-dir (expand-file-name "~/.emacs.d/autosave/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq auto-save-list-file-prefix autosave-dir)
(setq auto-save-file-name-transforms `((".*" ,autosave-dir t)))



(show-paren-mode 1)
(set-default 'indent-tabs-mode nil)
(set-default 'indicate-empty-lines t)

;; Stuff from starter-kit
(dolist (mode '(menu-bar-mode tool-bar-mode scroll-bar-mode)) (when (fboundp mode) (funcall mode -1)))
(hl-line-mode t)
(auto-fill-mode t)

; Moving cursor down at bottom scrolls only a single line, not half page
(setq scroll-step 1)
(setq scroll-conservatively 5)

(setq visible-bell t
      inhibit-startup-message t
      sentence-end-double-space nil
      shift-select-mode t
      mouse-yank-at-point t
      uniquify-buffer-name-style 'forward
      whitespace-style '(face trailing lines-tail tabs)
      whitespace-line-column 80
      ediff-window-setup-function 'ediff-setup-windows-plain
      oddmuse-directory (concat user-emacs-directory "oddmuse")
      save-place-file (concat user-emacs-directory "places")
      diff-switches "-u")

;; Don't ask about buffers with processes attached
(setq kill-buffer-query-functions
      (remq 'process-kill-buffer-query-function
            kill-buffer-query-functions))
(put 'narrow-to-region 'disabled nil)


(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(mapcar (lambda (elt) (add-to-list 'yes-or-no-p-history elt))
        '("no" "yes"))
