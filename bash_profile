# Load files in `$HOME/.shrc`
for file in "$HOME"/.dotfiles/shrc/*.sh; do
  source "$file"
done
unset file

PROMPT_COMMAND='PS1="\[$($HOME/.dotfiles/lib/bash_prompt.js)\]"'