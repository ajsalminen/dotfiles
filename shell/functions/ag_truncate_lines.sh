# page only when needed, set term to truncate lines for minified code etc.
# default to insensitive matches and include a global agignore for minified exts.
# Some info http://unix.stackexchange.com/questions/109211/preserving-color-output-with-cut
ag_truncate_lines() {
    tput rmam # turn off automatic margin mode.
    # reset colors at the beginning of line because rmam can cut some seqs out.
    ag --color -i --path-to-ignore=~/.grepignore "$@" | sed "s/^/$(tput sgr0)/" | less -XFr
    local ret="$?"
    tput smam # turn on automatic margin mode.
    return "$ret"
}
