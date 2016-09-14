# Download and apply a drupal.org patch to a new branch.
function drupal_patch_url() {
    patchname=$(echo "$1" | grep --color=never -Po '([^/]*)$')
    git checkout -b "$patchname"
    curl $1 | patch -p1
}
