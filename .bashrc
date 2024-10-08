# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# limits recursive functions, see 'man bash'
[[ -z "$FUNCNEST" ]] && export FUNCNEST=100

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lahv --ignore=..'   # show long listing of all except ".."
alias l='ls -lahv --ignore=.?*'   # show long listing but no hidden dotfiles except "."

stty -ixon

shopt -s autocd
HISTSIZE= HISTFILESIZE=

alias nv='nvim'
alias vim='nvim'
export VISUAL='nvim -e'
export EDITOR=nvim

alias s='startx'
alias g='git'
alias v='nvim .'
alias rmf='rm -rf'
alias :q='exit'

function mkcd() { mkdir -p -- "$1" && cd -P -- "$1"; }

source /usr/share/doc/pkgfile/command-not-found.bash
source ~/.config/gitstatus/gitstatus.prompt.sh
export PS1='\[$(tput bold)\]\[$(tput setaf 1)\][ \[$(tput setaf 3)\]\u\[$(tput setaf 2)\]@\[$(tput setaf 6)\]\h\[$(tput setaf 4)\]:\[$(tput setaf 5)\]\w ${GITSTATUS_PROMPT}\[$(tput setaf 1)\]]\[$(tput setaf 7)\]\$ '

# pnpm
export PNPM_HOME="/home/alicja/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# cargo
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/.cargo/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
fi
export PATH
