#!/bin/bash

# Dotfiles installation script
# Launched during the devcontainer bootstrap

dotfiles_dir=$(dirname "$(readlink -f "$0")")

printf "Installing dotfiles (marc-0x01/dotfiles) from %s \n" "$dotfiles_dir"

# Create symlinks
ln -nfs $dotfiles_dir/.bashrc $HOME/.bashrc
ln -nfs $dotfiles_dir/.aliases $HOME/.aliases >/dev/null 2>&1
ln -nfs $dotfiles_dir/.functions $HOME/.functions >/dev/null 2>&1
ln -nfs $dotfiles_dir/.extra $HOME/.extra >/dev/null 2>&1
