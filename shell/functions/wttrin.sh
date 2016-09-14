# Get current weather for any place from wttr.in.
# Example: "weather Helsinki"
weather () {
    wget --output-document=- --quiet http://wttr.in/$1
}
