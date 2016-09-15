# (from same guy as the prompt I think)
# countdown & timer {{{1
# (Ab)use prompt escapes to get the time without spawning a subshell. :)

function countdown() {
    local now remaining
    local epoch='%D{%s}'
    local target=$(( ${(%)epoch} + $1 ))

    while true; do
        now=${(%)epoch}
        remaining=$(( target - now ))

        if (( $remaining > 0 )) ; then
            printf '\rT-minus: %s' "${remaining}"
            sleep 0.5
        else
            printf '\a\n'
            break
        fi
    done
}
