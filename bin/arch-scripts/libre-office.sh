#!/usr/bin/env bash
: '
Install Libre Office and utilities.

For more information, see https://wiki.archlinux.org/title/LibreOffice
'

packages=(
    libreoffice-fresh   # LibreOffice branch which contains new features and program enhancement
    libreoffice-extension-writer2epub # Extension for creating ePub files from Libreoffice
    libreoffice-extension-languagetool # An Open Source style and grammar checker
    jre8-openjdk    # OpenJDK Java 8 full runtime environment
    hyphen      # library for high quality hyphenation and justification
    hyphen-en   # English hyphenation rules
    libmythes   # A simple thesaurus
    mythes-en   # Enligsh thesaurus
)

packages_string=$(printf " %s" "${packages[@]}")

yay -S --needed --noconfirm $packages_string

echo "Done!"
