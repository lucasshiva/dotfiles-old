#!/usr/bin/env bash
: '
This script will install a few programming languages and tools.
'
packages=(
    python  # High-level scripting language
    go      # Core compiler tools for the Go programming language
    lua     # Powerful lightweight language designed for extending applications
    perl    # A highly capable, feature-rich programming language
    ruby    # An object-oriented language for quick and easy programming
    julia   # High-level, high-performance, dynamic programming language
)

aur_packages=(
    visual-studio-code-bin  # Editor for building and debugging modern applications
)

# Join packages into a single line.
packages_string=$(printf " %s" "${languages[@]}")
aur_packages_string=$(printf " %s" "${tools[@]}")

# Download packages.
sudo pacman -S --needed --noconfirm $packages_string
yay -S --needed --noconfirm $aur_packages_string

echo "Done!"
