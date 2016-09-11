# Get current weather for any place from wttr.in.

weather () {
    wget --output-document=- --quiet http://wttr.in/$1
}
