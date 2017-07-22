;;; ob-ansible --- Org-Babel support for the Ansible configuration management system

;; Copyright (C) 2015 Ryan Rix

;; Author: Ryan Rix ry@n.rix.si
;; Maintainer: Ryan Rix ry@n.rix.si
;; Created: 2015-01-20
;; Keywords: ansible, literate programming
;; Homepage: http://doc.rix.si

;; This file is not part of GNU Emacs.

;; This file is *NOT* part of GNU Emacs

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA
;; 02111-1307, USA.

;;; Commentary:

;; This file allows you to tangle an Ansible playbook directory that you can
;; then use to deploy and manage your systems.

;;; Code:
(require 'ob)


(defcustom org-babel-ansible-playbook-command "ansible-playbook -i ~/Projects/devops/hosts"
  "Name of the command to use for running playbook code"
  :group 'org-babel
  :version "24.1"
  :type 'string)

(defun org-babel-ansible-create-playbook-header (name hosts user sudo connection)
  "Format a header string for an ansible playbook and return it"
  (format "---
- name: %s
  hosts: %s
  user: %s
  sudo: %s
  connection: %s

  tasks:
" . (name hosts user sudo connection)))

(defun org-babel-ansible-indent-body (str indent)
  "Prepend each line of the string with the specified number of spaces"
  (let ((str-list (split-string str "\n")))
    (mapconcat (lambda (line)
                 (concat "  " line))
               str-list
               "\n")))

(defun org-babel-expand-body:ansible (body params processed-params)
  "Expand BODY to be a full, valid org-mode playbook according to params, return the expanded body.

Valid params are:
- `name': description of the playbook
- `hosts': hosts to apply this playbook to
- `user': user to run it as
- `sudo': true or false, whether to use sudo when running
- `connection': use SSH or local connection
- `playbook': Whether to create a full playbook or not. Used to differentiate between tangle and execute"
  ;FIXME: Ensure these variables exist and provide defaults
  (let ((name  (cdr (assoc :name params)))
        (hosts (cdr (assoc :hosts params)))
        (user  (cdr (assoc :user params)))
        (sudo  (cdr (assoc :sudo params)))
        (connection (cdr (assoc :connection params)))
        (playbook (cdr (assoc :playbook params))))
    (catch 'break
      (if (equal playbook nil)
          (throw 'break body)
          (progn
            (concat (org-babel-ansible-create-playbook-header name hosts user sudo connection) "\n"
                    (org-babel-ansible-indent-body body 2) "\n"))))))

(defun org-babel-execute:ansible (body params)
  "Execute a block of Ansible plays
This function is called by `org-babel-execute-src-block'."
  (message "Executing Ansible playbook")
  (let* ((processed-params (org-babel-process-params params))
         (vars (second processed-params))
         (result-params (third processed-params))
         (result-type (fourth processed-params))
         (full-body (org-babel-expand-body:ansible
                     body params processed-params))
         (playbook-file (org-babel-temp-file "playbook-" "yml")))
    (message (format "%s %s" . (org-babel-ansible-playbook-command playbook-file)))
    (with-temp-file playbook-file (insert full-body))
    (let ((results (org-babel-eval
                    (concat org-babel-ansible-playbook-command " " playbook-file) "")))
      (let ((tmp-file (org-babel-temp-file "ansible-")))
        (with-temp-file tmp-file (insert results))
        (org-babel-import-elisp-from-file tmp-file)))))
