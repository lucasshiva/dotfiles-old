#!/usr/bin/sh

# Recommended
nitrogen --restore &
picom &
dunst &
thunar --daemon &
setxkbmap -model logitech_base -layout br -variant abnt2 &

# Optional
pcloud &
pulseeffects --gapplication-service &
