# Get current weather for any place from wttr.in.
# Example: "wthr Helsinki"
wthr () {
    wget --output-document=- --quiet http://wttr.in/$1
}
