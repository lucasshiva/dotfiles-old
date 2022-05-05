#!/usr/bin/env bash
: '
A compilation of different applications.

For a minimal installation, you will only require a terminal emulator, a file manager, 
a web browser, and a text editor.
'
packages=(
    kitty               # A modern, hackable, featureful, OpenGL-based terminal emulator
    firefox             # Standalone web browser from mozilla.org
    xed                 # A small and lightweight text editor. X-Apps Project
    neovim              # Fork of Vim aiming to improve user experience, plugins and GUIs
    gnome-screenshot    # Take pictures of your screen
    xarchiver           # GTK+ frontend to various command line archivers
    nitrogen            # Background browser and setter for X windows
    xreader             # Document viewer for files like PDF and Postscript. X-Apps Project.
    calibre             # Fully-featured eBook management application
    lxappearance        # Feature-rich GTK+ theme switcher of the LXDE Desktop
    baobab              # A graphical directory tree analyzer
    qbittorrent         # An advanced BitTorrent client
    gthumb              # Image browser and viewer for the GNOME desktop
    gnome-calculator    # GNOME Scientific calculator
    grub-customizer     # A graphical grub2 settings manager
    quodlibet           # Music player and music library manager
    gnome-system-monitor    # View current processes and monitor system state
    bitwarden		    # A secure and free password manager
    kid3-qt             # An MP3, Ogg/Vorbis and FLAC tag editor, Qt version
    vlc                 # Multi-platform MPEG, VCD/DVD, and DivX player


    # AUR packages. Some may take a long time to build.
    gammy               # Adaptive screen brightness/temperature tool
    joplin-appimage     # A note taking and to-do application with synchronization
    pcloud-drive        # pCloud drive. Electron edition
    mailspring          # A beautiful, fast, and maintained fork of Nylas Mail
    spotify             # A proprietary music streaming service
    soulseekqt          # A desktop client for the Soulseek peer-to-peer file sharing network
    ffmpeg-compat-57    # To play Spotify offline songs
)

# Apps that I am not currently using but may use in the future.
unused=(
    feh                 # Fast and light imlib2-based image viewer
    celluloid           # Simple GTK+ frontend for mpv
    rhythmbox           # Music playback and management application
    evince              # Document viewer for files like PDF and Postscript
    foliate             # A simple and modern GTK eBook reader
    dmenu               # Generic menu for X
    rofi                # A window switcher and application launcher
    picom               # X compositor that may fix tearing issues
    neofetch            # A CLI system information tool that supports displaying images
    remmina             # Remote desktop client written in GTK+
    shutter             # The feature-rich screenshot tool
    helix               # A post-modern modal text editor.

    ## AUR
    spotifywm-git       # Makes Spotify more friendly to window managers.
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
yay -S --needed --noconfirm $packages_string

echo "Done!"
