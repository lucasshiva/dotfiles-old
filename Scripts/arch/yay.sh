#!/usr/bin/env bash
# Yet Another Yogurt - An AUR Helper Written in Go. 

if type -p yay >/dev/null; then
    echo "Yay is already installed!"
else
    sudo pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git "$HOME/yay"
    cd "$HOME/yay"
    makepkg -si
fi

echo "Done!"
