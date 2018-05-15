# Run this after install nvm (and a version of node)
# TODO: Add nvm installation to this script
START_DIR=$(pwd)
npm install -g jshint
npm install -g eslint

##################### neovim #####################
# install neovim (and python support)
brew install neovim/neovim/neovim
pip install neovim

# Install plug and copy .vimrc
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.config/nvim
cd ~/.config/nvim
ln -s $START_DIR/../.vimrc init.vim
echo "Run \":PlugInstall\" next time you open neovim"

##################### ranger #####################
brew install ranger
cd $HOME/.config
ln -s $START_DIR/ranger .
cd $START_DIR
