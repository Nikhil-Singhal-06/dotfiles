# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

source_if_exists $HOME/.env.sh

#Oh-My-ZSH
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

source_if_exists $ZSH/oh-my-zsh.sh


# p10k
source_if_exists $DOTFILES/zsh/p10k.zsh

#Aliases
precmd() {
    source $DOTFILES/zsh/aliases.zsh
}


