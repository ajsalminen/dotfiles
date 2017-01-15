# CUA
bindkey "^[[3;5~" kill-word # Ctrl-Delete

# bash default
bindkey \^U backward-kill-line


bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards

# Use history that you can filter the beginning of.

autoload -Uz up-line-or-beginning-search
autoload -Uz down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '\eOA' up-line-or-beginning-search
bindkey '\e[A' up-line-or-beginning-search
bindkey '\eOB' down-line-or-beginning-search
bindkey '\e[B' down-line-or-beginning-search

bindkey '^T' fzf-file-widget
bindkey '\ec' fzf-cd-widget
bindkey '^R' fzf-history-widget

# ztanesh dirstack binds
bindkey '^[i'  insert-cycledleft
bindkey '^[n'  insert-cycledright

# Meta-m to chdir to the parent directory
bindkey -s '\em' '^Ucd ..; ls^M'

bindkey "^[q" fasd-complete
bindkey "^[w" fasd-complete-f
bindkey "^[t" fasd-complete-d

# jump-char
bindkey "^[f" vi-find-prev-char
bindkey "^[p" vi-find-next-char
