stty -ixon
shopt -s autocd

HISTSIZE= HISTFILESIZE=

alias grep='grep --color=auto'
alias ls='ls --color=auto'

alias ecfg='cd ~/.config/dotfiles && nvim .'
alias ta='tmux attach'
alias gs='git status'
alias H='Hyprland'

eval "$(starship init bash)"

export SCRIPT_PATH="$HOME/.local/bin"
case ":$PATH:" in
  *":$SCRIPT_PATH:"*) ;;
  *) export PATH="$SCRIPT_PATH:$PATH" ;;
esac
# pnpm
export PNPM_HOME="/home/alice/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
case ":$PATH:" in
  *":$CARGO_HOME/bin:"*) ;;
  *) export PATH="$CARGO_HOME/bin:$PATH" ;;
esac
