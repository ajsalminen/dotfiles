# Use locate to search for directory name.
locatedir () {
    for last; do true; done
    locate $1 | while read line
    do
        if [ -d "$line" ] ; then echo $line | grep "[^/]*$1[^/]*$" ; fi
    done
}
