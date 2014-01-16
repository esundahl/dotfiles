# Load files in `$HOME/.shrc`
for file in "$HOME"/.dotfiles/shrc/*.sh; do
  source "$file"
done
unset file


# Custom Prompt
function prompt () {
  PS1='\[$($HOME/.dotfiles/lib/bash_prompt.js)\] →  '
}
PROMPT_COMMAND=prompt