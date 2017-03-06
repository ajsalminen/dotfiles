# Use locate to search for a file name.
locatefile () {
    locate -b $1 | while read line
    do
        if [ -f "$line" ] ; then echo $line | grep "[^/]*$1[^/]*$" ; fi
    done
}
