export ZDOTDIR=$HOME/.dotfiles
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

zstyle ':prompt:pure:git:dirty' color yellow

HISTFILE=$HOME/.zhistory

# PATH updates
[[ -d "/snap/bin" ]] && export PATH="$PATH:/snap/bin"
source "$HOME/.cargo/env"

if $(which nvim > /dev/null); then
    alias vim=nvim
fi
export EDITOR='vim'
if $(which fzf > /dev/null); then
    source $HOME/.dotfiles/zsh/fzf.zsh
fi

LS_COLORS='rs=0:di=00;38;5;33:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;38;5;64:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:';
export LS_COLORS

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
