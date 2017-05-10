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
bindkey -s '^O' "lf\n"

# ztanesh dirstack binds
bindkey "^[^[[C" insert-cycledleft
bindkey "^[^[[D"  insert-cycledright

# Meta-m to chdir to the parent directory
bindkey -s '\em' '^Ucd ..; ls^M'

bindkey "^[q" fasd-complete
bindkey "^[w" fasd-complete-f
bindkey "^[t" fasd-complete-d

# jump-char
bindkey "^[n" vi-find-prev-char
bindkey "^[i" vi-find-next-char

bindkey "^[z" undo

bindkey "^[z" undo


# Very useful for cycling through arguments in command history
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^[," copy-earlier-word

# Word-level history completion.
bindkey "\eu" _history-complete-older
bindkey "\ee" _history-complete-newer

bindkey "^[l" shellword-backward-word
bindkey "^[y" shellword-forward-word
bindkey "^[f" shellword-backward-kill-word
bindkey "^[p" shellword-kill-word
