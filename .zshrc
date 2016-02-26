# Path to your oh-my-zsh installation.
source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen theme clean

antigen-apply

export PATH=/opt/cuda/bin:$PATH
export EDITOR=$(which nvim)

alias rg="ranger"
alias vi="nvim"
#alias vim="nvim"
alias top="top -o%CPU"
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# autocomplete stuff
#export fpath=($fpath $HOME/tmp/zsh-autocomplete)

#autoload -U compinit
#compinit
mocha() {
  if type whence &> /dev/null; then
    mocha=$(whence -p mocha)
  else
    mocha=$(type -P mocha)
  fi
  substitution='s/\x1b\[90m/\x1b[92m/g'

  $mocha -c "$@" > >(perl -pe "$substitution") 2> >(perl -pe "$substitution" 1>&2)
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


. $HOME/torch/install/bin/torch-activate
