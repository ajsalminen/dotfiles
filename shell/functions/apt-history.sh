# From https://github.com/miohtama/ztanesh
# Won't work on some shells because of the "-" in function name.
# Read apt log with "apt-history".
# Usage:
#   apt-history install
#   apt-history upgrade
#   apt-history remove
#   apt-history rollback
#   apt-history list
# Based On: http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html
apt-history () {
    case "$1" in
        install)
            zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
            ;;
        upgrade|remove)
            zgrep --no-filename $1 $(ls -rt /var/log/dpkg*)
            ;;
        rollback)
            zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
                grep "$2" -A10000000 | \
                grep "$3" -B10000000 | \
                awk '{print $4"="$5}'
            ;;
        list)
            zcat $(ls -rt /var/log/dpkg*)
            ;;
        *)
            echo "Parameters:"
            echo " install - Lists all packages that have been installed."
            echo " upgrade - Lists all packages that have been upgraded."
            echo " remove - Lists all packages that have been removed."
            echo " rollback - Lists rollback information."
            echo " list - Lists all contains of dpkg logs."
            ;;
    esac
}
