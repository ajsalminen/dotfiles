# Make sure it's path exists before opening file for editing in emacs.
emacs_create_and_edit() {
    ensure_dir "$1"

    if [[ $1 == *":"* ]]; then
        # Requires bash/zsh/ksh.
        filename=${1%%:*}
        line=${${1#*:}%%:*}
        if [ ! -z "$line" ] && [ ! -z "${line##*[!0-9]*}" ]; then
            emacsclient -n "+$line" "$filename"
        else
            emacsclient -n "$filename"
        fi
    else
        emacsclient -n "$1"
    fi
}
