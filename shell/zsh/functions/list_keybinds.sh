# Adapted from scmbreeze list_aliases.
list_keybinds () {
    bindkey | grep --color=always "$*" --color=never | awk -F " " '{ printf "\033[1;36m%15s  \033[2;37m=>\033[0m  %-8s\n",$1,$2}'
}
