#!/usr/bin/env bash
: '
Utility packages for Arch Linux
'

packages=(
    base-devel          # Includes tools needed for building (compiling and linking)
    file-roller         # Create and modify archives
    zip                 # Compressor/archiver for creating and modifying zipfiles
    unzip               # For extracting and viewing files in .zip archives
    unrar               # better RAR archive support
    unace               # ACE archive support
    lrzip               # lrzip archive support
    p7zip               # Command-line file archiver with high compression ratio
    gnome-keyring       # Stores passwords and encryption keys
    ntfs-3g             # NTFS filesystem driver and utilities
    dosfstools          # DOS filesystem utilities
    mtools              # A collection of utilities to access MS-DOS disks
    bat                 # Cat clone with syntax highlighting and git integration
    htop                # Interactive process viewer
    tree                # A directory listing program
    mlocate             # Merging locate/update implementation
    fzf                 # A command line fuzzy finder
    xclip               # Command line interface to the X11 clipboard
    ripgrep             # A search tool that combines ag with grep. (Use with rp)
    cronie              # Daemon that runs specified programs at scheduled times
    diff-so-fancy       # Good-looking diffs with diff-highlight and more
    dunst               # Customizable and lightweight notification-daemon
    which               # A utility to show the full path of commands
    reflector           # Retrieve and filter the latest Pacman mirror list
    zenity              # Display graphical dialog boxes from shell scripts
    numlockx            # Turns on the numlock key in X11
    pacman-contrib      # Contributed scripts and tools for pacman systems
    xsettingsd          # Provides settings to X11 applications
    cpupower            # Tool to examine and tune power related features of your processor
    exa                 # ls replacement
    ffmpegthumbnailer   # Lightweight video thumbnailer that can be used by file managers
    inxi                # Full featured CLI system information tool
    nemo-fileroller     # File archiver extension for Nemo
    nemo-preview        # Quick file previewer for Nemo
    zoxide		        # A smarter cd command for your terminal
    fd			        # Simple, fast and user-friendly alternative to find
    duf			        # Disk Usage/Free Utility


    # Applet for managing network connections
    network-manager-applet

    # Allow applications to extend a menu via Ayatana indicators in Unity, KDE
    # or Systray (GTK+ 3 library)
    libappindicator-gtk3
)


# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
yay -S --needed --noconfirm $packages_string

echo "Done!"
