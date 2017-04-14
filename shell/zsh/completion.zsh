# Add to fpath for autoloading some completions.
fpath=(~/.zsh $fpath)

# Complete both files and commands at the same time.
_files_and_commands () {
    _files
    local ret=$?
    _command_names || return ret
}

# Always match files first and command names only if no files match.
compdef '_files || _command_names' -command-
#compdef '_files_and_commands' -command-

# Complete on empty line instead of inserting a tab.
# (The default is mainly for pasting indented snippets.)
zstyle ':completion:*' insert-tab false
zstyle ':completion:*:(vs|vp|vu|vd|vh|va|vr):*' hosts "${(f)$(</etc/vagrant_hosts)}"
# Don't cache completion so new commands will be instantly available.
# https://unix.stackexchange.com/questions/2179/rebuild-auto-complete-index-or-whatever-its-called-and-binaries-in-path-cach
zstyle ":completion:*:commands" rehash 1

zstyle ':completion:history-words:*' list yes
zstyle ':completion:history-words:*' remove-all-dups yes


# Enable completion.
autoload -U compinit && compinit

# Completion for mosh aliases.
compdef rs=ssh
compdef os=ssh

# Completion for vagrant aliases.
compdef vs=ssh
compdef vp=ssh
compdef vu=ssh
compdef vd=ssh
compdef vr=ssh
compdef vh=ssh
compdef va=ssh
