# Add some extra keys to ssh-agent when ssh-add is called.
# Won't work on some shells because of the "-" in function name.
function ssh-add() {
    command ssh-add
    for i in $(find ~/.ssh/additional_keys/ -not -name '*.pub' -type f)
    do command ssh-add $i
    done
}
