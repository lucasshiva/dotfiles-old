#!/usr/bin/env bash

# Includes a few themes that don't come with Cinnamon.
# Yay is only needed for AUR packages.

packages=(
    papirus-icon-theme  # Papirus icon theme
    arc-gtk-theme       # A flat theme with transparent elements for GTK 3, GTK 2 and Gnome-Shell
)

aur_packages=(
    numix-cursor-theme          # Numix cursor theme for Linux
    plata-theme                 # A Gtk+ theme based on Material Design Refresh
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
