#!/bin/bash

# Dotfiles installation script
# Launched during the devcontainer bootstrap

dotfiles_dir=$(dirname "$(readlink -f "$0")")

# Create symlinks
ln -nfs $dotfiles_dir/.bashrc $HOME/.bashrc
for file in $dotfiles_dir/.{aliases,functions,stack_specific,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -nfs "$file" "$HOME/.$file";
done
unset file
