right_triangle() {
   echo $'\ue0b0'
}

arrow() {
   echo $'%B\u279C%b'
}

arrow_start() {
   echo "%{$FG[$ARROW_FG]%}%{$BG[$ARROW_BG]%}%B"
}

arrow_end() {
   echo "%b%{$reset_color%}%{$FG[$NEXT_ARROW_FG]%}%{$BG[$NEXT_ARROW_BG]%}$(right_triangle)%{$reset_color%}"
}

prompt_indicator() {
   echo $(arrow)
}

directory() {
   ARROW_FG="016"
   ARROW_BG="183"
   NEXT_ARROW_BG="139"
   NEXT_ARROW_FG="183"
   echo "%{$fg[cyan]%}%1~%{$reset_color%}"
}

git_prompt() {
   ARROW_FG="016"
   ARROW_BG="139"
   NEXT_ARROW_BG=""
   NEXT_ARROW_FG="096"
   echo "$(git_prompt_info)$(git_prompt_status)"
}

# set the git_prompt_info text
ZSH_THEME_GIT_PROMPT_PREFIX="(%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%})"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[white]%}"

PROMPT='$(directory)$(git_prompt) $(prompt_indicator) '
