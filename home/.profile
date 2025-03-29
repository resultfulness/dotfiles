export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc"
export CUDA_CACHE_PATH="$XDG_CACHE_HOME/nv"
export GOPATH="$XDG_DATA_HOME/go"
export WINEPREFIX="$XDG_DATA_HOME/wine"

export TERMINAL="alacritty"
export BROWSER="zen"
export EDITOR="nvim"
export VISUAL="nvim"

export NIXOS_OZONE_WL=1

if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi


