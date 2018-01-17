# COLOR_RED="\033[0;31m"
# COLOR_YELLOW="\033[0;33m"
# COLOR_GREEN="\033[0;32m"
# COLOR_MAGENTA="\033[0;35m"
# COLOR_CYAN="\033[0;36m"
# COLOR_OCHRE="\033[38;5;95m"
# COLOR_BLUE="\033[0;34m"
# COLOR_WHITE="\033[0;37m"
COLOR_RESET="\033[0m"
PROMPT_COLOR_PRIMARY="\033[38;5;95m"
PROMPT_COLOR_SECONDARY="\033[0;36m"

function git_branch {
  local git_status="$(git status 2> /dev/null)"
  local on_branch="On branch ([^${IFS}]*)"
  local on_commit="HEAD detached at ([^${IFS}]*)"

  if [[ $git_status =~ $on_branch ]]; then
    local branch=${BASH_REMATCH[1]}
    echo "$branch"
  elif [[ $git_status =~ $on_commit ]]; then
    local commit=${BASH_REMATCH[1]}
    echo "$commit"
  fi
}

PS1="\[$PROMPT_COLOR_PRIMARY\]\h\[$COLOR_WHITE\]:\[$PROMPT_COLOR_SECONDARY\]\W"
PS1+="\[$PROMPT_COLOR_PRIMARY\](\[$PROMPT_COLOR_SECONDARY\]\$(git_branch)\[$PROMPT_COLOR_PRIMARY\])"           # prints current branch
PS1+="\[$PROMPT_COLOR_SECONDARY\] → \[$COLOR_RESET\]"   # '#' for root, else '$'
export PS1
