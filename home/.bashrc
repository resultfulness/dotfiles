stty -ixon
shopt -s autocd

HISTSIZE= HISTFILESIZE=

alias grep='grep --color=auto'
alias ls='ls --color=auto'
alias :q='exit'

alias ecfg='cd ~/.config/dotfiles && nvim .'
alias ta='tmux attach'
alias gpush='git push'

export PATH="$PATH:$HOME/.local/bin"
