# from https://github.com/miohtama/ztanesh
eval "insert-cycledleft () { zle push-line; LBUFFER='pushd -q +1'; zle accept-line }"
zle -N insert-cycledleft
eval "insert-cycledright () { zle push-line; LBUFFER='pushd -q -0'; zle accept-line }"
zle -N insert-cycledright
