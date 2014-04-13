
# Git Aliases
##################################
alias g="git status"
alias ga='git add'
alias gb='git branch'
alias gba='git branch -a'
alias gc='git commit'
alias gca='git commit -v -a'
alias gco='git checkout'
alias gcod='git checkout develop'
alias gcom='git checkout master'
alias gd='git diff | vimdiff'
alias gf="git fetch"
alias gl='git lg'
alias gm="git merge"
alias gp="git push"
alias gpod="git push origin develop"
alias gpom="git push origin master"
alias grl="git reflog"
alias gs='git status'
##################################


source $HOME/.dotfiles/lib/git-completion.sh
source $HOME/.dotfiles/lib/git-flow-completion.sh
