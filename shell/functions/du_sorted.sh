# https://gist.github.com/janmoesen/1156154
# Sort du's output but use human-readable units.
function duh {
    du -sk "$@" | sort -n;
    du -sk "$@" | sort -n | while read size fname; do
	for unit in KiB MiB GiB TiB PiB EiB ZiB YiB; do
	    if [ "$size" -lt 1024 ]; then
		echo -e "${size}${unit}\t${fname}";
		break;
	    fi;
	    size=$((size/1024));
	done;
    done;
}
