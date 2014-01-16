
# Git Aliases
##################################
alias gs='git status'
alias gl='git lg'
alias gp='git push'
alias gd='git diff | vimdiff'
alias gc='git commit'
alias gca='git commit -v -a'
alias gb='git branch'
alias gba='git branch -a'
alias ga='git add'
alias gco='git checkout'
##################################


source $HOME/.dotfiles/lib/git-completion.sh
source $HOME/.dotfiles/lib/git-flow-completion.sh