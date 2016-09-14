# Create the directory or directories for a given path if it doesn't exist.
# Works at least in bash/zsh.
ensure_dir(){
    # extract everything before / from $1.
    dir="${1%/*}"
    if [ -n "$dir" ] && [ "$dir" != "$1" ]
    then
        mkdir -p $dir
    fi
}
