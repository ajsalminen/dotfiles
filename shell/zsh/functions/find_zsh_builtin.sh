# From https://github.com/oldratlee/my-zsh-settings/blob/master/my-zsh-settings.plugin.zsh
# show type -a and which -a info together, very convenient!
find_zsh_builtin() {
    echo "type -a:\n"
    # type builtin command can output which file the function is defined in.
    type -a "$@"
    echo "\nwhich -a:\n"
    # which builtin command can output the function implementation.
    which -a "$@"
}
