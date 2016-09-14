# Install dependencies for a .deb package.
# The first one will get installed when there are multiple alternatives.
function install_deb() {
    dpkg -I $1 | grep Depends: | sed -r 's/(^ Depends: )|(\([^\)]+\))|(\| [^ ]+)|,//g' | xargs apt-get install
}
