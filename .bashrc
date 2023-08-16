#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/.cargo/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH

[[ -z "$FUNCNEST" ]] && export FUNCNEST=100          # limits recursive functions, see 'man bash'

alias ls='ls --color=auto'
alias ll='ls -lahv --ignore=..'   # show long listing of all except ".."
alias l='ls -lahv --ignore=.?*'   # show long listing but no hidden dotfiles except "."
alias ls='exa'
alias ll='exa -la'
alias l='exa -l'
alias grep='grep --color=auto'
export PS1='\[$(tput bold)\]\[$(tput setaf 1)\][ \[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h\[$(tput setaf 4)\]:\[$(tput setaf 5)\]\w\[$(tput setaf 1)\] ]\[$(tput setaf 7)\]\$ '

## Use the up and down arrow keys for finding a command in history
## (you can write some initial letters of the command first).
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

shopt -s autocd
HISTSIZE= HISTFILESIZE=

export EDITOR=nvim
alias vim='nvim'
export VISUAL=vim
export BROWSER=firefox
export TERMINAL=alacritty
export ANDROID_HOME=$HOME/Android/Sdk
export NDK_HOME="$ANDROID_HOME/ndk/25.0.8775105"
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

bind '"\C-f": "sessionizer\n"'

alias s='startx'
alias g='git'
alias c='codium'
alias v='vim'
alias rf='rm -rf'
alias cp='cp -rv'
alias rem='yay -Rcnsu'
alias ka='killall'
alias :q='exit'

alias cat='bat'

alias dotfiles='/usr/bin/git --git-dir=$HOME/personal/.dotfiles --work-tree=$HOME'

mkcd() {
    mkdir -p -- "$1" &&
       cd -P -- "$1"
}

source /usr/share/nvm/init-nvm.sh
source /usr/share/doc/pkgfile/command-not-found.bash


# pnpm
export PNPM_HOME="/home/alicja/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
