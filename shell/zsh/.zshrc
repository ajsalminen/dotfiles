# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

plugins=(extract colored-man mosh sudo drush debian zsh-syntax-highlighting zaw ergoemacs-keybinds vagrant)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH

source ~/.commonrc
source ~/opt/zsh/zaw/zaw.zsh

globalias() {
   if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
     zle _expand_alias
     zle expand-word
   fi
   zle self-insert
}

zle -N globalias

bindkey " " globalias
bindkey "^ " magic-space           # control-space to bypass completion
bindkey -M isearch " " magic-space # normal space during searches


# One of these has to be defined for git_add_and_commit to work (why?).
bindkey '^[[1;5C' forward-word                        # [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5D' backward-word                       # [Ctrl-LeftArrow] - move backward one word


# realiaser config.
# function last_command() {
# echo `history | tail -1 | cut -d ' ' -f 3-20 | realiaser`
# }

# RPROMPT='%{$fg[$NCOLOR]%}%p $(last_command)%{$reset_color%}'

# history
## Command history configuration
HISTFILE=$HOME/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

unsetopt append_history
setopt extended_history
unsetopt hist_expire_dups_first
unsetopt hist_ignore_dups # ignore duplication command history list
setopt HIST_IGNORE_SPACE
setopt hist_verify
setopt inc_append_history
# setopt share_history # share command history data

# By default, zsh considers many characters part of a word (e.g., _ and -).
# Narrow that down to allow easier skipping through words via M-f and M-b.
export WORDCHARS='*?[]~&;!$%^<>'


# Set a short term title for oh-my-zsh term title config.
ZSH_THEME_TERM_TITLE_IDLE="%# %~"

# This has to be sourced at the end of zshrc.
#source ~/opt/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# http://zshwiki.org/home/zle/bindkeys
