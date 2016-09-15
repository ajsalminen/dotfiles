alias g=ag_truncate_lines
alias e=emacs_create_and_edit
alias ppj=pretty_print_json
alias pcd=php_drupalcs
alias md='mkdir -p'
alias rs=mosh_root
alias dud='du --max-depth=1 -h'
alias duf='du -sh *'
alias grep="grep --color=always"
alias ls="ls --color=always"
alias less="less -XFr"

alias t='multitail --retry-all -f'
alias to='htop'

# ls, the common ones I use a lot shortened for rapid fire usage
alias ls='ls --color'
alias ll='ls -l'

# search for commands
alias cnf=/usr/lib/command-not-found

alias howdoi='howdoi --all --num-answers 2'


alias gic='git difftool --extcmd icdiff -y'
alias gcd='git difftool --extcmd colordiff -y'

# Alias for gitjk
alias gitjk="history 10 | tac | gitjk_cmd"

# Alias for faster work with ansible
alias an="ansible-playbook -D  -i production site.yml --tags=$1 -l $2 --ask-vault-pass"

# nice idea from https://github.com/ElijahLynn/dotfiles/blob/master/home/.bash_aliases
# Make a sound for when commands finish.
export tada='/home/elijah/bin/sounds/TaDa.ogg'
alias a='paplay $tada'
alias ifconfig='echo learn to use "ip" instead.'
