function _timer_elapsed() {
    local epoch='%D{%s}'
    local start=$1
    local end=${(%)epoch}

    printf '\nElapsed time: %s seconds\n' "$(( end - start ))"
}

function timer() {
    local dts='%D{%H:%M:%S}'
    local epoch='%D{%s}'
    local start=${(%)epoch}

    trap '_timer_elapsed '"${start}"'; return;' INT

    printf 'Starting timer at %s\n' "${(%)dts}"
    while true; do
        printf '\r%s' "${(%)dts}"
        sleep 0.5
    done
}
