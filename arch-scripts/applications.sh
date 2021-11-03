#!/usr/bin/env bash
: '
A compilation of different applications.

For a minimal installation, you will only require a terminal emulator, a file manager, 
a web browser, and a text editor.
'
packages=(
    kitty               # A modern, hackable, featureful, OpenGL-based terminal emulator
    xterm               # X Terminal Emulator
    nemo                # Cinnamon file manager (Nautilus fork)
    firefox             # Standalone web browser from mozilla.org
    chromium            # Browser built for speed, simplicity, and security
    xed                 # A small and lightweight text editor. X-Apps Project
    vim                 # A highly configurable, improved version of the vi text editor
    neovim              # Fork of Vim aiming to improve user experience, plugins and GUIs
    gnome-screenshot    # Take pictures of your screen
    scrot               # Simple command-line screenshot utility for X
    xarchiver           # GTK+ frontend to various command line archivers
    feh                 # Fast and light imlib2-based image viewer
    nitrogen            # Background browser and setter for X windows
    celluloid           # Simple GTK+ frontend for mpv
    rhythmbox           # Music playback and management application
    evince              # Document viewer for files like PDF and Postscript
    xreader             # Document viewer for files like PDF and Postscript. X-Apps Project.
    foliate             # A simple and modern GTK eBook reader
    dmenu               # Generic menu for X
    rofi                # A window switcher and application launcher
    picom               # X compositor that may fix tearing issues
    task                # A command-line todo list manager
    neofetch            # A CLI system information tool that supports displaying images
    calibre             # Fully-featured eBook management application
    lxappearance        # Feature-rich GTK+ theme switcher of the LXDE Desktop
    baobab              # A graphical directory tree analyzer
    qbittorrent         # An advanced BitTorrent client
    gthumb              # Image browser and viewer for the GNOME desktop
    gnome-calculator    # GNOME Scientific calculator
    grub-customizer     # A graphical grub2 settings manager
    gnome-system-monitor    # View current processes and monitor system state
)

# Some AUR packages may take a LONG time to build. Install them at your own risk. 
# Some will also ask for your password at the end, don't run this part and go afk.
aur_packages=(
    gammy               # Adaptive screen brightness/temperature tool
    joplin-appimage     # A note taking and to-do application with synchronization
    pcloud-drive        # pCloud drive. Electron edition
    bitwarden-bin       # A secure and free password manager
    mailspring          # A beautiful, fast, and maintained fork of Nylas Mail
    spotify             # A proprietary music streaming service
    spotifywm-git       # Makes Spotify more friendly to window managers.
    ffmpeg-compat-57    # To play Spotify offline songs
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"