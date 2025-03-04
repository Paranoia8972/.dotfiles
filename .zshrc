export EDITOR=nvim
export TERM=xterm-kitty
export TERMINAL=kitty

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# Prompt
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

zle_highlight+=(paste:none)

# History
HISTSIZE=9000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='ls --color'
alias vim='nvim'
alias c='clear'
alias cat='bat'
alias s='kitten ssh'
alias icat="kitten icat"
alias hist='cat ~/.zsh_history | fzf'
alias nvm='nvim'
alias npx='bunx'

mkcd() {
    mkdir -p "$1" && cd "$1"
}

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# bun completions
[ -s "/home/paranoia/.bun/_bun" ] && source "/home/paranoia/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH=$PATH:$(go env GOPATH)/bin
export CGO_CFLAGS="-w -O2 -Wno-stringop-overread"

# rust
source $HOME/.cargo/env

# encore
export ENCORE_INSTALL="/home/paranoia/.encore"
export PATH="$ENCORE_INSTALL/bin:$PATH"

# devcontainers
source $HOME/.config/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin

# fastfetch
pfetch

export PATH="/home/paranoia/.config/herd-lite/bin:$PATH"
export PHP_INI_SCAN_DIR="/home/paranoia/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval $(thefuck --alias)

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

. "$HOME/.local/bin/env"

# astral uv
source $HOME/.local/bin/env
