php_unserialize_print_r () { php -r 'print_r(unserialize($argv[1]));' "$1" | less }
