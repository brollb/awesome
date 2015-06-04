# Awesome config
if [ -e $HOME/.config/awesome ]; then
    echo "Awesome config found at $HOME/.config/awesome. Skipping..."
else
    ln -s $(pwd)/awesome $HOME/.config/awesome
fi

# Ranger config
if [ -e $HOME/.config/ranger ]; then
    echo "Ranger config found at $HOME/.config/ranger. Skipping..."
else
    ln -s $(pwd)/ranger $HOME/.config/ranger
fi

# Vim config
if [ -e $HOME/.vimrc ]; then
    echo "Vim config found at $HOME/.vimrc. Skipping..."
else
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    ln -s $(pwd)/.vimrc $HOME/.vimrc
fi

