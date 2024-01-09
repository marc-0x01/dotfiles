# .bashrc configuration

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

## Set standard shell attributes
set -o vi
set -o noclobber
set -o ignoreeof
set -o notify

## Set sensible shell options, whenever possible
for option in nocaseglob histappend cmdhist cdable_vars extglob \
              autocd globstar checkwinsize dirspell cdspell; do
	shopt -s "$option" 2> /dev/null;
done

## Readline bindings
bind "set completion-ignore-case on"
bind "set completion-map-case on"
bind "set show-all-if-ambiguous on"
bind "set mark-symlinked-directories on"
bind "set editing-mode vi"
# Remap standard keybinds
bind -m vi-insert "\C-f:forward-char"
bind -m vi-insert "\C-b:backward-char"
bind -m vi-insert "\C-a:beginning-of-line"
bind -m vi-insert "\C-e:end-of-line"
bind -m vi-insert "\C-k:backward-kill-line"
bind -m vi-insert "\C-l:clear-screen"
bind -m vi-insert "\C-p:previous-history"
bind -m vi-insert "\C-n:next-history"
bind -m vi-insert "\C-r:reverse-search-history"
bind -m vi-insert "\C-g:abort"
bind -m vi-insert "\C-u:undo"

## Setup infinite history
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_history
export HISTCONTROL="erasedups:ignoreboth"
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history:clear"
export HISTTIMEFORMAT='%F %T '

## Optimize directory navigation
export CDPATH=".:~:~/workspace"

## Load additional shell dotfiles, when available
for file in ~/.{aliases,functions,stack_specific,extra}; do
	printf "Trying to source %s if it exists... " "$file"
	[ -r "$file" ] && [ -f "$file" ] && source "$file" && printf "OK"
	printf "\n"
done
unset file
