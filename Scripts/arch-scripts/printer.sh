#!/usr/bin/env bash
: '
Install printing support for Arch Linux.

CUPS is the standards-based, open source printing system currently developed by 
Apple Inc. for macOS® and other UNIX®-like operating systems.

For more information, see https://wiki.archlinux.org/title/CUPS
'
packages=(
    cups                    # The CUPS Printing System - daemon package
    cups-pdf                # PDF printer for cups
    libcups                 # The CUPS Printing System - client libraries and headers
    system-config-printer   # A CUPS printer configuration tool and status applet
    hplip   # Drivers for HP DeskJet, OfficeJet, Photosmart, Business Inkjet and some LaserJet
    gutenprint              # Top quality printer drivers for POSIX systems
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string

# Enable services
sudo systemctl --now enable cups.service

# cups provides a cups.socket unit. If cups.socket is enabled 
# (and cups.service is disabled), systemd will not start CUPS immediately; 
# it will just listen to the appropriate sockets. Then, whenever a program 
# attempts to connect to one of these CUPS sockets, systemd will start cups.service 
# and transparently hand over control of these ports to the CUPS process. 

# sudo systemctl --now enable cupsd.socket

echo "Done!"
