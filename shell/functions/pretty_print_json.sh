# Pretty print a json file.
pretty_print_json() {
    cat_url_or_file $1 | python -mjson.tool | pygmentize -l javascript | less -Xfr
}
