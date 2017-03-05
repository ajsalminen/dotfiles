# Use locate to search for a file name.
locatefile () {
    locate $1 | while read line
    do
        if [ -fd "$line" ] ; then echo $line | grep "[^/]*$1[^/]*$" ; fi
    done
}
