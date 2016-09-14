
# Run find with chmod with given parameters to all files of a type under path.
# Default to the current directory.
function find_chmod() {
    if [ -z "$3" ]; then
        find_path="."
    else
        find_path=$3
    fi
    find $find_path -type $1 -exec chmod $@ {} \;
}
