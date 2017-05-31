export ZDOTDIR=$HOME/.dotfiles
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

HISTFILE=$HOME/.zhistory

export EDITOR='vim'

# Stolen from oh-my-zsh
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# On babun/cygwin/windows, use pageant and ssh-pageant for ssh-agent and forwarding
# TODO: Update this to be lsw friendly (and let's finally deprecate cygwin)
# if [[ $(uname -o) = "Cygwin" ]];
# then
#     alias open="cygstart"
#     eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME") &> /dev/null
# fi
