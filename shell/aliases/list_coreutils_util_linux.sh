# Just an idea that needs refining for now.
alias list_coreutils='dpkg -L coreutils | egrep '\.gz' | xargs -L1 zfgrep -A1 'SH NAME' | sort -u'
alias list_util_linux='dpkg -L util-linux | egrep '\.gz' | xargs -L1 zfgrep -A1 'SH NAME' | sort -u'
