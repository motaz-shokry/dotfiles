HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# shell integrations
eval "$(fzf --zsh)"

# The following lines were added by compinstall
zstyle :compinstall filename '/home/motaz/.zshrc'

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download zinit, if it's not.
if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# load completions
autoload -Uz compinit && compinit
# compinit
# End of lines added by compinstall

# Starship Theme
eval "$(starship init zsh)"

# Aliases
alias nv="nvim" 
alias u="doas pacman -Syu"
alias i="doas pacman -S"
alias r="doas pacman -Rsn"
alias q='doas pacman -Si'
alias s="doas pacman -Ss"
alias how="tldr"
alias ll="eza -laMug --icons=always --color=always --smart-group --time-style relative"
alias ls="eza -a --icons=always --color=always"
alias code="codium"
alias ip='ip -color=auto'
alias grep='grep --color=auto'
alias diff='diff --color=auto'
alias yt='yt-dlp --extract-audio --add-metadata --xattrs --embed-thumbnail --audio-quality 0 --audio-format mp3' # youtube-dl
alias ytv='yt-dlp --merge-output-format mp4 -f "bestvideo+bestaudio[ext=m4a]/best" --embed-thumbnail --add-metadata'
alias c="clear"
#RTL or LTR
printf "\e[?2501h"

# launch bicon if not launched
if ! [[ "$(ps -p $(ps -p $(echo $$) -o ppid=) -o comm=)" =~ 'bicon'* ]]; then
  bicon.bin
fi

# vim binds 
bindkey -v
bindkey '^k' history-search-backward
bindkey '^j' history-search-forward

# completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -a --icons=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'eza -a --icons=always $realpath'

# bun completions
[ -s "/home/motaz/.bun/_bun" ] && source "/home/motaz/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

