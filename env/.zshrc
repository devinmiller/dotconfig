export XDG_CONFIG_HOME=$HOME/.config

bindkey -s ^f "tmux-sessionizer\n"

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
