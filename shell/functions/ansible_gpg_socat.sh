# Read ansible passwords from a named pipe and let gpg write them on demand there.

passwords_pipe(){
    while [ -f $pipelock ]
    do
        socat -u EXEC:"gpg -d $crypted" CREATE:$decrypted;
    done
}

ansible_gpg_socat(){
    playbookpath=~/projektit/ansible/kifi-playbooks
    pipepath=$playbookpath/.local/vars
    pipelock=/tmp/passwords_pipe.lock
    crypted=$pipepath/passwords.yml.gpg
    decrypted=$pipepath/passwords.yml


    touch $pipelock
    passwords_pipe &
    command=$1
    shift
    # bash/zsh and some others
    command $command $@
    rm $pipelock
    timeout 1 cat $decrypted > /dev/null # One more attempted read to make it exit

}

# vagrant(){
# ansible_gpg_socat $0 $@
# }
# ansible-playbook(){
# ansible_gpg_socat $0 $@
# }

# ansible-playbook-debugger(){
# ansible_gpg_socat $0 $@
# }
