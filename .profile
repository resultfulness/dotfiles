export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GOPATH="$XDG_DATA_HOME/go"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export WINEPREFIX="$XDG_DATA_HOME/wine"
export DOCKER_CONFIG="$XDG_CONFIG_HOME/docker"

export TERMINAL="kitty"
export BROWSER="zen-browser"
export EDITOR="nvim"
export VISUAL="nvim"

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
