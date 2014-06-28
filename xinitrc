#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

export PATH=~/.cabal/bin:$PATH

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi
xkbcomp -I$HOME/.xkb ~/.xkb/keymap/mykbd $DISPLAY
nm-applet --sm-disable &

xrdb -merge ~/.Xresources
# kbdd won't launch more than one instance
kbdd
# Disable screensaver
xset s off
# Keybindings

# These applications will automatically die when X server dies
pidgin &
firefox &
parcellite &

termite -e weechat &

awesome

# Kill programs that don't die automatically
pkill weechat
pkill kbdd
pkill termite
