# Run ansible for vagrant with the right key and playbook from any subdirectory.
ansible_vagrant_run() {
    # Some of this may not be needed.
    ANSIBLE_SSH_ARGS='-o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -o IdentityFile=~/.vagrant.d/insecure_private_key -o ForwardAgent=yes'
    ANSIBLE_HOST_KEY_CHECKING=false
    vagrant_top=$(find_up Vagrantfile)

    playbook=$(grep 'ansible.playbook' ${vagrant_top}Vagrantfile | sed -e 's/^.*"\(.*\)".*$/\1/')
    ansible-playbook -i ${vagrant_top}.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory -s --u vagrant $playbook --private-key=/home/anttis/.vagrant.d/insecure_private_key "$@"
}
