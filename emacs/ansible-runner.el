;;; ansible-runner --- run ansible.
;;; Commentary:
;;; It's cool.

;;; Code:

(defvar ansiblerunner-hosts "all")
(defvar ansiblerunner-playbook "/home/anttis/projektit/ansible/kifi-playbooks/site.yml")
(defvar ansiblerunner-inventory "/home/anttis/projektit/vagrant/vagrant_ansible_dev/inventory")
(defvar ansiblerunner-ansible-command "ansible-playbook -D")

(defun ansiblerunner-compile (start end)
(interactive "r")
(let ((playbook (make-temp-file "ansible")))
(write-region (concat "- hosts: all\n\n  tasks:\n") nil playbook)
(write-region start end playbook t)
(compile (concat ansiblerunner-ansible-command " -i /home/anttis/projektit/vagrant/vagrant_ansible_dev/inventory -l monihaku " playbook t)))
)

(defun ansiblerunner-run ()
(interactive)
(setq default-directory "/home/anttis/projektit/vagrant/vagrant_ansible_dev")
(let ((default-directory "/home/anttis/projektit/vagrant/vagrant_ansible_dev"))
(compile (concat ansiblerunner-ansible-command " -i " ansiblerunner-inventory " -l "
ansiblerunner-hosts " --start-at-task '" (ansiblerunner-current-task-name) "' --step "
 ansiblerunner-playbook ) t))
)

(defun ansiblerunner-current-task-name ()
(interactive)
(re-search-forward "name: " (line-end-position))
(buffer-substring-no-properties (point) (line-end-position)))

(provide 'ansible-runner)
;;; ansible-runner.el ends here
