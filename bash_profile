# Load files in `$HOME/.shrc`
for file in "$HOME"/.dotfiles/shrc/*.sh; do
  source "$file"
done
unset file

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
