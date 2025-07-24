# load modules
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors

# cmp opts
zstyle ':completion:*' menu select
zstyle ':completion:*' special-dirs true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^ap "aws-sso-picker\n"

addToPath() {
  if [[ "$PATH" != *"$1"* ]]; then
    export PATH=$PATH:$1
  fi
}

addToPathFront() {
  if [[ ! -z "$2" ]] || [[ "$PATH" != *"$1"* ]]; then
    export PATH=$1:$PATH
  fi
}

addToPath /usr/local/go/bin
addToPath $HOME/go/bin

addToPathFront $HOME/.local/scripts
addToPathFront $HOME/.local/bin

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
