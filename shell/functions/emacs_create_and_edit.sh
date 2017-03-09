# Make sure it's path exists before opening file for editing in emacs.
emacs_create_and_edit() {
    ensure_dir "$1"

    if [[ $1 == *":"* ]]; then
        filename="$(echo "$1" | cut -d ":" -f 1)"
        line="+$(echo "$1" | cut -d ":" -f 2)"
    else
        filename="$1"
        line=""
    fi
    emacsclient -n $line "$filename"
}
