#!/usr/bin/env bash
:'
Font packages for Arch Linux.

This script will also install Microsoft Fonts from an existing Windows 10 partition.
For more information, see https://wiki.archlinux.org/index.php/Microsoft_fonts
'
# Path to the Windows 10 C: partition. Leave it blank if you don't have a Windows 
# partition, or simply do not want to install its fonts.
windows_dir="/Windows10/System"

packages=(
    noto-fonts          # Google Noto TTF fonts
    noto-fonts-cjk      # Google Noto CJK fonts
    ttf-opensans        # Sans-serif typeface commissioned by Google
    cantarell-fonts     # Humanist sans serif font
    gsfonts             # (URW)++ base 35 font set
    ttf-merriweather    # A typeface that is pleasant to read on screens
    ttf-merriweather-sans #  A sans-serif typeface that is pleasant to read on screens
    otf-fantasque-sans-mono # Font family with a great monospaced variant for programmers
)

# Some packages may take a long time to build.
# Remove some packages if you don't want/need all of them.
# Nerd fonts are patched versions of the original fonts. 
# For more info: https://www.nerdfonts.com/
aur_packages=(
    nerd-fonts-jetbrains-mono # A Nerd Font patched version of JetBrains Mono
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")
aur_packages_string=$(printf " %s" "${aur_packages[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

# Check if directory exists
# This will not run if the directory is an empty string.
if [ $windows_dir ] && [ -d $windows_dir ]; then
    # Create fonts directory.
    sudo mkdir /usr/share/fonts/WindowsFonts

    # Copy all fonts from Windows partition to the fonts directory.
    sudo cp ${windows_dir}/Windows/Fonts/* /usr/share/fonts/WindowsFonts/

    # Change fonts permission.
    sudo chmod 644 /usr/share/fonts/WindowsFonts/*
fi

# Regenerate the fontconfig cache
fc-cache -f

echo "Done!"
