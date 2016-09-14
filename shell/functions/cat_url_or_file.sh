# cat a file, accepting an URL or path.

cat_url_or_file() {
    if [[ $1 == http://* || $1 == https://* ]]
    then
        curl -H "Accept: application/json" $1
    else
        cat $1
    fi
}
