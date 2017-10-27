#!/bin/sh
[ -r /etc/profile ] && source /etc/profile
export PATH=$PATH:~/.nix-profile/bin:~/bin
# This can help with java GUI programs.
export _JAVA_AWT_WM_NONREPARENTING=1
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/neo2qwerty $DISPLAY
# Reverse buttons
xmodmap -e "pointer = 3 2 1"
# fake this to make xdg-open work
# export DE=gnome
eval $(gpg-agent --daemon)
eval $(ssh-agent)
export EDITOR=emacsclient
# Without this there will be error messages with git.
unset GNOME_KEYRING_CONTROL
trayer --edge top --align right --SetDockType true --expand true --width 10 --transparent true --tint 0x000000 --height 20 & # --SetPartialStrut false
#~/bin/private_startup
urxvt &
#nm-applet &
#terminator -x selfspy &
keynav &

# Disable touchpad on Thinkpad (from https://github.com/soleblaze/dotfiles/blob/master/xconfigs/xinitrc)
touchpad=$(xinput | grep "SynPS/2 Synaptics TouchPad" | sed 's/.*id=\([0-9]*\).*/\1/')
xinput --disable "$touchpad"

xhost +local:
urxvt -title container-start -e container-start &

xmonad
