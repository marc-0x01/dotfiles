# .zshrc configuration

## If not running interactively, don't do anything
[ -z "$PS1" ] && return

## Set additions to the path
export PATH="$HOME/bin:$PATH"

## Set locale
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8

## Set common programs
export EDITOR="vi"
export PAGER="less -R"

## Modules
zmodload zsh/complist
zmodload zsh/zle

## Set sensible shell options, whenever possible
for option in AUTO_CD NO_BEEP \
              MENU_COMPLETE AUTO_LIST COMPLETE_IN_WORD \
              AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_SILENT \
              CORRECT CDABLE_VARS EXTENDED_GLOB \
              EXTENDED_HISTORY HIST_VERIFY HIST_EXPIRE_DUPS_FIRST HIST_FIND_NO_DUPS HIST_SAVE_NO_DUPS \
              HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE; do
	setopt "$option" #2> /dev/null;
done

## Keybinds and vi mode
export KEYTIMEOUT=1
bindkey -v
bindkey -M menuselect "h" vi-backward-char
bindkey -M menuselect "k" vi-up-line-or-history
bindkey -M menuselect "l" vi-forward-char
bindkey -M menuselect "j" vi-down-line-or-history
# Remap standard keybinds
bindkey "^f" forward-char
bindkey "^b" backward-char
bindkey "^a" beginning-of-line
bindkey "^e" end-of-line
bindkey "^k" backward-kill-line
bindkey "^l" clear-screen
bindkey "^p" up-line-or-history
bindkey "^n" down-line-or-history
bindkey "^r" history-search-backward
bindkey "^g" send-break

## Setup infinite history
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILESIZE=
export HISTFILE=~/.zsh_history
export HISTCONTROL="erasedups:ignoreboth"
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTTIMEFORMAT='%F %T '

## Completions
autoload -U compinit; compinit

## Optimize directory navigation (devcontainers)
export CDPATH=".:~:/workspaces:/vscode/dotfiles"

## Hook direnv
eval "$(direnv hook zsh)"

## Load additional shell dotfiles, when available
for file in ~/.{aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file" 
done
unset file

clear
echo " ███▄ ▄███▓ ▄▄▄       ██▀███   ▄████▄     "
echo "▓██▒▀█▀ ██▒▒████▄    ▓██ ▒ ██▒▒██▀ ▀█     "
echo "▓██    ▓██░▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄    "
echo "▒██    ▒██ ░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒   "
echo "▒██▒   ░██▒ ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░   "
echo "░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░   "
echo "░  ░      ░  ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒      "
echo "░      ░     ░   ▒     ░░   ░ ░ marc-0x01 "
echo "  ZSH  ░         ░  ░   ░     ░ ░ dotfiles"

[[ -n "NIX_PROFILE" ]] && [[ $CODESPACES == true ]] && echo "🚀 Type 'devenv shell' to start your development environment!"
