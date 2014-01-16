# Load files in `$HOME/.shrc`
for file in "$HOME"/.dotfiles/shrc/*.sh; do
  source "$file"
done
unset file


# Custom Prompt
function prompt () {
  PS1='\[$($HOME/.dotfiles/lib/git-prompt.js)\] →  '
}
PROMPT_COMMAND=prompt