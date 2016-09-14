# Make sure it's path exists before opening file for editing in emacs.
emacs_create_and_edit() {
    ensure_dir $1
    emacsclient -n $1
}
