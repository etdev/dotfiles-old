ZSH_THEME="awesomepanda"
ZSHRC="$(readlink $HOME/.zshrc)"
export DOTFILES="$( cd "$(dirname "$ZSHRC")"; pwd -P)"

fpath=($DOTFILES/.zsh/src/zsh-completions/src $fpath)

source $DOTFILES/.zsh/basic.zshrc
source $DOTFILES/.zsh/history.zshrc

if [ -f $DOTFILES/.zsh/oh-my-zsh.zshrc ]; then
  source $DOTFILES/.zsh/oh-my-zsh.zshrc
fi

export EDITOR="/usr/bin/vim"

GOBIN=$(which go 2>&1)
if [ -z $0 ]; then
  export GOROOT="$(cd "$(dirname "$(which go)" )"/.. ; pwd )"
  export GOPATH=$HOME/dev
fi

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward

bindkey "^W" backward-kill-word    # vi-backward-kill-word
bindkey "^H" backward-delete-char  # vi-backward-delete-char
bindkey "^U" kill-line             # vi-kill-line
bindkey "^?" backward-delete-char  # vi-backward-delete-char

# $1 = type; 0 - both, 1 - tab, 2 - title
# rest = text
setTerminalText () {
    # echo works in bash & zsh
    local mode=$1 ; shift
    echo -ne "\033]$mode;$@\007"
}
stt_both  () { setTerminalText 0 $@; }
stt_tab   () { setTerminalText 1 $@; }
stt_title () { setTerminalText 2 $@; }

# Automatically run ls after cd
function chpwd() {
    emulate -L zsh
        ls -a
      }

# Curl benchmarking function
curl-test(){ curl --silent -i $1 | grep X-Runtime; }
