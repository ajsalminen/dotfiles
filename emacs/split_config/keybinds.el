
;; Standard cut/copy/paste and shift selection.
(cua-mode t)

;; A minor mode with the keys to override all other.
;; http://stackoverflow.com/questions/683425/globally-override-key-binding-in-emacs/5340797#5340797
(defvar my-keys-minor-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-w") 'kill-this-buffer)
    (define-key map (kbd "C-s") 'save-buffer)
    (define-key map (kbd "M-b") 'ace-jump-mode)
    (define-key map (kbd "M-s") 'other-window)
    (define-key map (kbd "M-SPC") (lambda() (interactive) (push-mark nil nil 1)))
    (define-key map (kbd "M-a") 'helm-M-x)
    (global-set-key (kbd "M-1") 'helm-dash-at-point)
    (define-key map (kbd "M-•") 'ag)
    (define-key map (kbd "M-m") 'comment-eclipse)
    (define-key map (kbd "C-9") 'hs:all-toggle-hiding)
    (define-key map (kbd "M-i") 'jump-char-forward)
    (define-key map (kbd "M-n") 'jump-char-backward)
    (define-key map (kbd "M-f") 'backward-kill-sexp)
    (define-key map (kbd "M-p") 'kill-sexp)
    (define-key map (kbd "M-y") 'forward-sexp)
    (define-key map (kbd "M-l") 'backward-sexp)
    (define-key map (kbd "M-c") 'newline)
    (define-key map (kbd "M-(") 'scroll-up-command)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  :init-value t
  :lighter " my-keys")

(my-keys-minor-mode 1)

(global-set-key (kbd "<M-delete>") 'kill-word)
(global-set-key (kbd "<C-delete>") 'kill-word)

(global-set-key (kbd "<home>") 'move-beginning-of-line)
(global-set-key (kbd "<end>") 'move-end-of-line)

(global-set-key (kbd "<C-home>") 'beginning-of-buffer)
(global-set-key (kbd "<C-end>") 'end-of-buffer)

(global-set-key (kbd "<C-left>") 'backward-word)
(global-set-key (kbd "<C-right>") 'forward-word)

;;  (global-set-key (kbd "<M-up>") 'ergoemacs-backward-block)
;;  (global-set-key (kbd "<M-down>") 'ergoemacs-forward-block)
(global-set-key (kbd "C-r") 'revert-buffer)

(global-set-key (kbd "C-a") 'mark-whole-buffer)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-l") 'goto-line)
;;  (global-set-key (kbd "C-n") 'ergoemacs-new-empty-buffer)
(global-set-key (kbd "C-o") 'helm-find-files)

(define-key org-mode-map (kbd "C-v") 'cua-paste)

;; (define-key browse-kill-ring-mode-map (kbd "C-f") 'browse-kill-ring-search-forward)
;; (define-key browse-kill-ring-mode-map (kbd "<deletechar>") 'browse-kill-ring-delete)


(define-key helm-map (kbd "C-w") 'helm-keyboard-quit)

;;(define-key isearch-mode-map (kbd "C-c") 'isearch-yank-word-or-char)
;;(define-key isearch-mode-map (kbd "C-v") 'ergoemacs-paste)

(global-set-key (kbd "M-3") 'delete-other-windows)
(global-set-key (kbd "M-2") 'delete-window)
(global-set-key (kbd "M-4") 'split-window-below)
(global-set-key (kbd "M-5") 'split-window-right)

(global-set-key (kbd "<escape>") 'keyboard-quit)
(define-key isearch-mode-map (kbd "<escape>") 'isearch-abort)


(define-key helm-find-files-map (kbd "C-n") 'helm-find-files-up-one-level)
(define-key helm-read-file-map (kbd "C-n") 'helm-find-files-up-one-level)
(define-key helm-find-files-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "C-<backspace>") 'backward-kill-word)
(define-key helm-read-file-map (kbd "C-<backspace>") 'backward-kill-word)
(define-key helm-find-files-map (kbd "C-f") 'helm-ff-run-grep)
(define-key helm-read-file-map (kbd "C-f") 'helm-ff-run-grep)
(define-key helm-find-files-map (kbd "M-,") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "M-,") 'helm-execute-persistent-action)

(define-key helm-generic-files-map (kbd "C-n") 'helm-find-files-up-one-level)
(define-key helm-generic-files-map (kbd "C-i") 'helm-execute-persistent-action)
(define-key helm-generic-files-map (kbd "C-<backspace>") 'backward-kill-word)
(define-key helm-generic-files-map (kbd "C-f") 'helm-ff-run-grep)
(define-key helm-generic-files-map (kbd "M-,") 'helm-execute-persistent-action)


;; For some reason can't set these for the helm modes unless these are also set expicitly.
(global-set-key (kbd "C-l") 'goto-line)
(global-set-key (kbd "C-t") 'isearch-forward)
(global-set-key (kbd "M-,") 'tags-loop-continue)

(global-set-key (kbd "M-.") 'helm-gtags-dwim)
(global-set-key (kbd "C-7") 'helm-gtags-find-files)
;; Not working right now, test later
;; (global-set-key (kbd "C-7") 'helm-gtags-tags-in-this-function)
(global-set-key (kbd "M-9") 'helm-gtags-select)

(global-set-key (kbd "M-ä") 'hs-toggle-hiding)
(global-set-key (kbd "C-ä") 'hs-hide-level)

; relocated binds with colemak switch
(global-set-key (kbd "C-d") 'keyboard-quit) ;; C-g (TODO: does not work in isearch?)
(global-set-key (kbd "C-f") 'isearch-forward) ;; C-f
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(global-set-key (kbd "M-d") 'kill-line)
(global-set-key (kbd "M-j") 'kill-word)

(define-key todotxt-mode-map (kbd "w")   'pymodoro-start)


;; ediff keybinds, see ediff.el.
(add-hook
 'ediff-keymap-setup-hook
 (lambda ()
   (define-key ediff-mode-map [left]            'my-ediff-scroll-left-1)
   (define-key ediff-mode-map [right]           'my-ediff-scroll-right-1)
   (define-key ediff-mode-map [up]              'my-ediff-scroll-up-1)
   (define-key ediff-mode-map [down]            'my-ediff-scroll-down-1)
   (define-key ediff-mode-map [(control left)]  'my-ediff-scroll-left)
   (define-key ediff-mode-map [(control right)] 'my-ediff-scroll-right)
   (define-key ediff-mode-map [(prior)]   'my-ediff-scroll-up)
   (define-key ediff-mode-map [(next)]  'my-ediff-scroll-down)
   (define-key ediff-mode-map [(next)]  'my-ediff-scroll-down)
   (define-key ediff-mode-map [(control home)]  'my-ediff-first-difference)
   (define-key ediff-mode-map [(control end)]  'my-ediff-last-difference)
   (define-key ediff-mode-map (kbd "d") 'ediff-toggle-wide-display)))


;; Adding this globally because a ergoemacs component doesn't seem to override it.
(global-set-key (kbd "<menu>") nil)
(global-set-key (kbd "<menu> o") 'helm-fasd)
(global-set-key (kbd "<menu> t") 'switch-to-buffer)

;; open keyboard shortcut image with F8 key
(global-set-key (kbd "<f9>")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/ergoemacs-layout-sv.png")))

(global-set-key (kbd "<f7>")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/neo2qwerty.png")))


(global-set-key (kbd "C-<f7>")
                (lambda ()
                  (interactive)
                  (find-file "~/.emacs.d/emacs_cheatsheet.org")))

(global-set-key [delete] 'delete-char)

(global-set-key (kbd "C-8") 'speedbar)

(global-set-key (kbd "M-t") 'er/expand-region)

(global-set-key (kbd "M->") 'scroll-down-command)

(define-key helm-map (kbd "M-i") 'helm-execute-persistent-action)


(define-key php-mode-map (kbd "C-c C-y") 'yas/create-php-snippet)
