alias g=ag_truncate_lines
alias e=emacs_create_and_edit
alias ppj=pretty_print_json
alias pcd=php_drupalcs
alias hta=html2ascii
alias md='mkdir -p'
alias rs=mosh_root
alias dud='du --max-depth=1 -h'
alias duf='du -sh *'
alias grep="grep --color=auto"
alias ls="ls --color=auto"
alias less="less -XFr"

alias t='multitail --retry-all -f'
alias to='htop'

# reverse order, sorted by modification time descending
alias lt='ls --reverse -t'
alias ll='ls --reverse -tl'

# search for commands
alias cnf=/usr/lib/command-not-found

alias howdoi='howdoi --all --num-answers 2'


alias gic='git difftool --extcmd icdiff -y'
alias gcd='git difftool --extcmd colordiff -y'

alias mit='mit "Antti J. Salminen"'

# Alias for gitjk
alias gitjk="history 10 | tac | gitjk_cmd"

# Alias for faster work with ansible
alias an="ansible-playbook -D  -i production site.yml --tags=$1 -l $2 --ask-vault-pass"

# nice idea from https://github.com/ElijahLynn/dotfiles/blob/master/home/.bash_aliases
# Make a sound for when commands finish.
export tada='/home/elijah/bin/sounds/TaDa.ogg'
alias a='paplay $tada'

alias ifconfig='echo learn to use "ip" instead. See "iproute2_cheat".'
alias netstat='echo learn to use "ss" instead.'
alias iwconfig='echo learn to use "iw" instead.'
alias route='echo learn to use "ip r" instead. See "iproute2_cheat".'
alias arp='echo learn to use "ip n" instead. See "iproute2_cheat".'
alias iptunnel='echo learn to use "ip tunnel" instead. See "iproute2_cheat".'
alias nameif='echo learn to use "ip link"/"ifrename" instead. See "iproute2_cheat".'

alias iproute2_cheat='links http://baturin.org/docs/iproute2/'
alias nettools_cheat='links https://dougvitale.wordpress.com/2011/12/21/deprecated-linux-networking-commands-and-their-replacements/'
alias ssc='ss -4tanpioe state established'
