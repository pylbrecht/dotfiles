#!/bin/bash
set -euf -o pipefail

echo [-] installing packages from official repositories..
sudo pacman -S --needed --noconfirm - < pkgs.txt

echo [-] installing packages from AUR..
while IFS='' read -r pkg_name; do
    install_dir=$(mktemp -d)
    git clone https://aur.archlinux.org/$pkg_name $install_dir
    cd $install_dir
    makepkg -sci --noconfirm --needed
    cd -
done < "pkgs_aur.txt"
