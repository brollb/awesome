# This is not pretty... should probably be refactored...
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

# X stuff
if [ -e $HOME/.xinitrc ]; then
    echo "Config found at $HOME/.xinitrc. Skipping..."
else
    ln -s $(pwd)/.xinitrc $HOME/.xinitrc
fi

if [ -e $HOME/.Xresources ]; then
    echo "Config found at $HOME/.Xresources Skipping..."
else
    ln -s $(pwd)/.Xresources $HOME/.Xresources
fi

