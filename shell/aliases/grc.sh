# Colours for a bunch of commands with grc.
GRC=$(which grc)
if [ "$TERM" != dumb ] && [ -n GRC ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute6='colourify /usr/bin/traceroute6'
    alias ps='colourify ps'
    alias curl='colourify curl'
    alias hexdump='colourify hexdump'
fi
