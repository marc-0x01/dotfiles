# Dotfiles installation script
# Launched during the devcontainer bootstrap

# Create symlinks
ln -nfs $HOME/dotfiles/.bashrc $HOME/.bashrc
for file in $HOME/dotfiles/.{aliases,functions,stack_specific,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && ln -nfs "$file" "$HOME/.$file";
done
unset file