export ZDOTDIR=$HOME/.dotfiles
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':prompt:pure:git:dirty' color yellow

HISTFILE=$HOME/.zhistory

if which nvim; then
    alias vim=nvim
fi
export EDITOR='vim'

# Stolen from oh-my-zsh
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

source $HOME/.dotfiles/zsh/fzf.zsh

# On babun/cygwin/windows, use pageant and ssh-pageant for ssh-agent and forwarding
# TODO: Update this to be lsw friendly (and let's finally deprecate cygwin)
# if [[ $(uname -o) = "Cygwin" ]];
# then
#     alias open="cygstart"
#     eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME") &> /dev/null
# fi

# WSL specific configuration
if $(uname -a | grep -q Microsoft);
then
    [[ "$(umask)" == '000' ]] && umask 002


  # Auto venv
  function cd() {
      builtin cd "$@"

      #  If env folder is found then activate the vitualenv
      if [[ -d ./.venv ]] ; then
          source ./.venv/bin/activate
      fi

      if [[ -n "$VIRTUAL_ENV" ]] ; then
          # check the current folder belong to earlier VIRTUAL_ENV folder
          # if yes then do nothing
          # else deactivate
          parentdir="$(dirname "$VIRTUAL_ENV")"
          if [[ "$PWD"/ != "$parentdir"/* ]] ; then
              deactivate
          fi
      fi
    }
fi
