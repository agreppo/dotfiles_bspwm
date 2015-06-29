#!/bin/sh

# On charge la conf
xrdb -merge "${HOME}/.Xresources"

# Définition de la résolution
xrandr -s 1280x800 &

# Set Cursor
xsetroot -cursor_name left_ptr &

# Launch
sxhkd &
exec bspwm

