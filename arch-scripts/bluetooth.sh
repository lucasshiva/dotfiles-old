#!/usr/bin/env bash
: '
Install bluetooth support for Arch Linux.

Bluetooth is a standard for the short-range wireless interconnection of cellular phones,
computers, and other electronic devices. In Linux, the canonical implementation of the
Bluetooth protocol stack is BlueZ. 

For more information, see https://wiki.archlinux.org/title/Bluetooth
'
packages=(
    bluez           # Daemons for the bluetooth protocol stack
    bluez-libs      # Libraries for the bluetooth protocol stack
    bluez-utils     # Dev utilities for the bluetooth protocol stack
    blueman         # GTK+ Bluetooth Manager
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Load modules
[[ -z $(lsmod | grep btusb) ]] && echo "Loading module.." && sudo modprobe btusb

# Enable services
sudo systemctl --now enable bluetooth.service

echo "Done!"
