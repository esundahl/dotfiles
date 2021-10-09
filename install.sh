
# Setup oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Setup VIM
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Link dotfiles
ln -sf $PWD/zshrc $HOME/.zshrc
ln -sf $PWD/vimrc $HOME/.vimrc
ln -sf $PWD/gitignore $HOME/.gitignore
ln -sf $PWD/gitconfig $HOME/.gitconfig
ln -sf $PWD/eslintrc $HOME/.eslintrc
