autoload -U filter-select; filter-select -i



bindkey "^[a" zaw
bindkey "^[y" zaw-history
bindkey -M filterselect '^[[1;5C' emacs-forward-word
bindkey -M filterselect '^[[1;5D' emacs-backward-word
bindkey -M filterselect "^[[3~" delete-char-or-list
bindkey -M filterselect "^[e" backward-kill-word
bindkey -M filterselect "^[[3;5~" kill-word
#bindkey -M filterselect "⇐" kill-line
#bindkey -M filterselect "∈" backward-kill-line
bindkey -M filterselect "^[OH" beginning-of-line
bindkey -M filterselect "^[OF" end-of-line
bindkey -M filterselect "^[n" beginning-of-history
bindkey -M filterselect "^[N" end-of-history

bindkey -M filterselect "^[[1;5C" emacs-forward-word
bindkey -M filterselect "^[[1;5D" emacs-backward-word
