# Works in bash and zsh, makes mv/cp automatically create dirs if missing.
mkdir_copy_or_move() {
    destination="${@: -1}"
    ensure_dir $destination
    "$@"
}
