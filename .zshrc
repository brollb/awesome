# Path to your oh-my-zsh installation.
source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
antigen bundle git
antigen bundle command-not-found

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle kennethreitz/autoenv
antigen theme clean

antigen-apply

export PATH="/home/brian/.gem/ruby/2.1.0/bin:/home/brian/.gem/ruby/2.2.0/bin:/usr/local/heroku/bin:/home/brian/.gem/ruby/2.1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/bin:/opt/android-sdk/platform-tools:/opt/android-sdk/tools:/opt/java/bin:/opt/java/db/bin:/opt/java/jre/bin:/usr/bin/vendor_perl:/usr/bin/core_perl"
export EDITOR=$(which nvim)

alias rg="ranger"
alias vi="nvim"
alias vim="nvim"
alias top="top -o%CPU"
alias grep="/usr/bin/grep $GREP_OPTIONS"
unset GREP_OPTIONS

# added by travis gem
[ -f /home/brian/.travis/travis.sh ] && source /home/brian/.travis/travis.sh
source /usr/share/nvm/init-nvm.sh

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
