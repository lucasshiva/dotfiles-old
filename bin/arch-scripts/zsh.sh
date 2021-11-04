#!/usr/bin/env bash
: '
Install ZSH and some plugins. Also sets ZSH as default shell.
You will need to log out and log in for this changes to apply.
'
packages=(
    zsh                             # A very advanced and programmable shell for UNIX.
    zsh-autosuggestions             # Fish-like autosuggestions for zsh
    zsh-pure-prompt                 # Pretty, minimal and fast ZSH prompt
    zsh-syntax-highlighting         # Fish shell like syntax highlighting for Zsh
)

# Merge packages into a single string.
packages_string=$(printf " %s" "${packages[@]}")

# Download packages.
yay -S --needed --noconfirm $packages_string

# Change default shell to ZSH.
chsh -s $(which zsh)

echo "Done! Log out and log in for changes to apply."
