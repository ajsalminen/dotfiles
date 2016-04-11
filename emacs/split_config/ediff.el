;; Nicer ediff setup.
;; Sources used:
;; http://emacro.cvs.sourceforge.net/viewvc/emacro/emacro/elisp/emacro/lisp/e-common.el?revision=1.3&view=markup
;; https://github.com/rodprice/emacs-config/blob/73dd45a771a4f6e47d6ef9e5abdedffe79652c00/base/my-ediff.el
;; https://github.com/justbur/evil-ediff/blob/c852bf960db9a9f13089b29c1b68ab4fffe55171/evil-ediff.el


;; For scrolling to work in ediff correctly.
;; http://unix.stackexchange.com/questions/29378/emacs-ediff-not-scrolling-buffers-equally
(setq truncate-partial-width-windows t)

;; Side-by-side ediff.
(setq ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)


(defun ediff-with-existing-windows ()
  "Ediff the two buffers currently displayed."
  (interactive)
  (if (not (= (count-windows) 2))
      (message "You need exactly two windows open to use `ediff-with-existing-windows'.")
    (setq ediff-window-a (first  (window-list)))
    (setq ediff-window-b (second (window-list)))
    (let ((buf-a (window-buffer ediff-window-a))
          (buf-b (window-buffer ediff-window-b)))
      (ediff-buffers buf-a buf-b))))


(defun my-ediff-scroll-left (&optional arg)
  "Scroll left."
  (interactive "P")
  (let ((last-command-event ?>))
    (ediff-scroll-horizontally arg)))

(defun my-ediff-scroll-right (&optional arg)
  "Scroll right."
  (interactive "P")
  (let ((last-command-event ?<))
    (ediff-scroll-horizontally arg)))


;; Set current-prefix-arg because ediff-scroll-horizontally doesn't actually use arg.
(defun my-ediff-scroll-left-1 (&optional arg)
  "Scroll left."
  (interactive "P")
  (let ((last-command-event ?>) (current-prefix-arg 1))
    (ediff-scroll-horizontally 1)))

;; Set current-prefix-arg because ediff-scroll-horizontally doesn't actually use arg.
(defun my-ediff-scroll-right-1 (&optional arg)
  "Scroll right."
  (interactive "P")
  (let ((last-command-event ?<) (current-prefix-arg 1))
    (ediff-scroll-horizontally 1)))

(defun my-ediff-scroll-up (&optional arg)
  "Scroll up by half of a page."
  (interactive "P")
  (let ((last-command-event ?V))
    (ediff-scroll-vertically arg)))

(defun my-ediff-scroll-down (&optional arg)
  "Scroll down by half of a page."
  (interactive "P")
  (let ((last-command-event ?v))
    (ediff-scroll-vertically arg)))

(defun my-ediff-scroll-down-1 ()
  "Scroll down by a line."
  (interactive)
  (let ((last-command-event ?v))
    (ediff-scroll-vertically 1)))

(defun my-ediff-scroll-up-1 ()
  "Scroll down by a line."
  (interactive)
  (let ((last-command-event ?V))
    (ediff-scroll-vertically 1)))


(defun my-ediff-first-difference ()
  "Jump to first difference."
  (interactive)
  (ediff-jump-to-difference 1))

(defun my-ediff-last-difference ()
  "Jump to last difference."
  (interactive)
  (ediff-jump-to-difference ediff-number-of-differences))
