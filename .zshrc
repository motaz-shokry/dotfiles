# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/motaz/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
#Starship Theme
eval "$(starship init zsh)"
#Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#fpath=(/home/motaz/Downloads/githubs/zsh-completions/src $fpath)
#Aliases
alias nv="nvim" 
alias u="doas pacman -Syu"
alias i="doas pacman -S"
alias r="doas pacman -Rns"
alias q='doas pacman -Ss'
alias how="tldr"
alias ll="eza -laMug --icons=always --smart-group --time-style relative"
alias ls="eza -a --icons=always"
alias code="codium"
#RTL or LTR
#printf "\e[?2501h"

