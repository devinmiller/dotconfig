# follow XDG base dir specification
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

# add directories to path
export PATH="$HOME/.local/scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# moving other files and some other vars
export GOPATH="$XDG_DATA_HOME/go"
export GOBIN="$GOPATH/bin"
export GOMODCACHE="$XDG_CACHE_HOME/go/mod"
export NVM_DIR="$XDG_CONFIG_HOME/nvm"

# add Go location to path
export PATH="$GOBIN:$PATH"

# add Linux homebrew location
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt:$PATH"
# add variable for tmux shell
export TMUX_SHELL=$(which zsh)

export FZF_DEFAULT_OPTS="--style default --color dark --layout=default --height=100% --no-preview"
export FZF_CTRL_R_OPTS="--style default --color dark --layout=default --height=100% --info inline --no-sort --no-preview" # separate opts for history widget
