# Find a file in parent directory.
# From http://unix.stackexchange.com/questions/6463/find-searching-in-parent-directories-instead-of-subdirectories
find-up() {
    path=$(pwd)
    while [[ "$path" != "" && ! -e "$path/$1" ]]; do
        path=${path%/*}
    done
    echo "$path/"
}
