vman() {
    # It's shameless stolen from <http://www.vim.org/tips/tip.php?tip_id=167>
    #f5# Use \kbd{vim} as your manpage reader
    emulate -L zsh
    if (( ${#argv} == 0 )); then
        printf 'usage: vman <topic>\n'
        return 1
    fi
    man "$@" | col -b | vim -X -R -c "set ft=man nomod nolist" -
}
