# Pipe cheat output to less.
cheat() {
    command cheat $@ | less
}

cheat_edit(){
    cheatsheets_repo=~/repos/cheatsheets

    if [ -d $cheatsheets_repo ]
    then
        cd $cheatsheets_repo
        git pull
    else
        git clone git@github.com:ajsalminen/cheatsheets.git ~/repos/cheatsheets
    fi

    cd $cheatsheets_repo
    $EDITOR $@
    git commit -a -m "Updated cheatsheet for $@."
    git push
    fresh
}
