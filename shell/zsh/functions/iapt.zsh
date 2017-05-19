function iapt() {
    if [ -z "$1" ]; then
        echo "Usage: iapt <initial search string> - select packages on peco and they will be installed"
    else
        sudo apt-cache search $1 | peco | awk '{ print $1 }' | tr "\n" " " | xargs -- sudo apt-get -y install
    fi
}