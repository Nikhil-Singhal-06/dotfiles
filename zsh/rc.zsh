# Instant prompt for Powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Utility functions
source_if_exists () {
    if test -r "$1"; then
        source "$1"
    fi
}

export_if_exists() {
    if [[ -e "$1" ]]; then
        export "$2"="$1"
    else
        echo "Destination $1 does not exist, skipping export."
    fi
}

# Load optional environment
source_if_exists "$HOME/.env.sh"

# Define dotfiles path if missing
export DOTFILES="${DOTFILES:-$HOME/dotfiles}"

# Oh My Zsh
export_if_exists "$HOME/.oh-my-zsh" ZSH
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  web-search
  history
  sudo
  tmux
)

source_if_exists "$ZSH/oh-my-zsh.sh"

# Powerlevel10k config
source_if_exists "$DOTFILES/zsh/p10k.zsh"

# Load aliases dynamically before each prompt
precmd() {
    source "$DOTFILES/zsh/aliases.zsh"
}

# Path and locale
export PATH="$HOME/.cargo/bin:$PATH"
export LANG=en_US.UTF-8

# Pyenv setup (uncomment if needed)
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"
# eval "$(pyenv init -)"
