# Because booting hangs if a VM is running, stop all of them first.
# http://askubuntu.com/questions/457329/shutting-down-all-virtualbox-vagrant-vms-in-one-easy-to-use-bash-command-that
reboot(){
    vboxmanage list runningvms | sed -r 's/.*\{(.*)\}/\1/' | xargs -L1 -I {} VBoxManage controlvm {} savestate
    command sudo reboot
}
