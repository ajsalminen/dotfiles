# List the files for git diff and show diff for selected one.
gdf() {
    git diff --name-only $@ | fzf | xargs git diff $@ --
}
