#!bash

function current_git_branch () {
  # '$(__git_ps1 " %s")'

  local current_branch=$(__git_ps1)

  # No Branch
  if [[ "$current_branch" = "" ]]; then
    printf " "

  # Master Branch
  elif [[ "$current_branch" = "master" ]]; then
    local color=${Cyan}
    printf " ($color$current_branch\e[m)$(git_dirty $color)"

  # Develop Branch
  elif [[ "$current_branch" = "develop" ]]; then
    local color=${Green}
    printf " ($color$current_branch\e[m)$(git_dirty $color)"

  # Feature Branch
  elif [[ "$current_branch" == feature/* ]]; then
    local color=${Blue}
    printf " ($color${current_branch/feature\/}\e[m)$(git_dirty $color)"

  # Bug Branch
  elif [[ "$current_branch" == bug/* ]]; then
    local color=${Red}
    printf " ($color${current_branch/bug\/}\e[m)$(git_dirty $color)"

  # Refactor Branch
  elif [[ "$current_branch" == refactor/* ]]; then
    local color=${Yellow}
    printf " ($color${current_branch/refactor\/}\e[m)$(git_dirty $color)"

  else
    local color=${Magenta}
    printf " ($color$current_branch\e[m)$(git_dirty $color)"
  fi

}

function git_dirty {
    st=$(git status 2>/dev/null | tail -n 1)
    if [[ $st != "nothing to commit (working directory clean)" ]]
    then
        printf $1
    fi
}
