# Get matching entries from commandlinefu.
function cli_fu() {
    curl "http://www.commandlinefu.com/commands/matching/$(echo "$@" | sed 's/ /-/g')/$(echo -n $@ | base64)/plaintext" | less
}
