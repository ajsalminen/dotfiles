# http://serverfault.com/questions/413231/how-to-get-all-fingerprints-for-ssh-authorized-keys2-file
# Example ssh_fingerprints .ssh/authorized_keys
function ssh_fingerprints() {
    local file="$1"
    while read l; do
        [[ -n $l && ${l###} = $l ]] && ssh-keygen -l -f /dev/stdin <<<$l
    done < $file
}
