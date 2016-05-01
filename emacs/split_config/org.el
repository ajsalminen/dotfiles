
(require 'calfw)
(require 'calfw-org)

(add-hook 'org-mode-hook
          (lambda ()
            (org-indent-mode t)
            (setq truncate-lines nil))
          t)
(setq org-startup-truncated nil)
;; (setq org-agenda-files '("~/Documents/org"))
(load-library "find-lisp")
(setq org-agenda-files (find-lisp-find-files "~/Documents/org" "\.org$"))
;; concat org-directory
(setq org-default-notes-file "~/Documents/org/refile.org")
(define-key global-map "\C-cc" 'org-capture)
(server-start)
(require 'org-protocol)

(setq org-capture-templates
'(("z"
"Bookmark"
entry
(file+headline "~/Documents/org/refile.org" "Bookmarks")
"* %:description\n   :PROPERTIES:\n   :DateCreated: %U\n   :Type: Bookmark\n   :END:\n\n  Source: %u, %c\n\n%i"
:empty-lines 1)
("w"
 "To-read"
 entry
 (file+headline "~/Documents/org/refile.org" "To-read bookmarks")
 "* %:description\t:to_read:\n   :PROPERTIES:\n   :DateCreated: %U\n   :Type: Bookmark\n   :END:\n\n  Source: %u, %c\n\n%i"
 :empty-lines 1)))
;; (setq org-refile-targets '((org-agenda-files . (:level . 1))))

(require 'f)

;; From glimpse
(defun glimpse-list-to-alist (list thing)
"Returns a dummy alist created by consing t and the members of the input list"
  (if (not list)
      nil
    (let (alist)
      (cons (cons (car list) thing)
            (glimpse-list-to-alist (cdr list) thing)))))


(defun refresh-org-refile-targets ()
  "Rebuilds the list of refile targets."
  (setq org-refile-targets-filelist (f-files "~/Documents/org" (lambda (file) (equal (f-ext file) "org")) t))
(setq org-refile-targets (glimpse-list-to-alist org-refile-targets-filelist '(:level . 1))))
(refresh-org-refile-targets)

;; Allow new nodes and use filename for targets.
(setq org-refile-allow-creating-parent-nodes 'confirm)
(setq org-refile-use-outline-path 'file)

(server-start)
(require 'org-protocol)

(add-to-list 'load-path "~/opt/ob-ansible")
(load "ob-ansible.el")
