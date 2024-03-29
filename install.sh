#!/bin/sh

#Remove files if they exist
if [ -f ~/.screenrc ]; then
  rm -rf ~/.screenrc
fi
if [ -f ~/.gitconfig ]; then
  rm -rf ~/.gitconfig
fi
if [ -f ~/.gemrc ]; then
  rm -rf ~/.gemrc
fi
if [ -f ~/.tmux.conf ]; then
  rm -rf ~/.tmux.conf
fi
if [ -f ~/.vimrc ]; then
  rm -rf ~/.vimrc
fi
if [ -f ~/.screenrc ]; then
  rm -rf ~/.vimrc.bundles
fi

DOTFILES="$( cd "$(dirname "$0")" ; pwd -P )"

[ ! -L ~/.screenrc   ] && ln -s $DOTFILES/.screenrc  ~/.screenrc
[ ! -L ~/.gitconfig  ] && ln -s $DOTFILES/.gitconfig ~/.gitconfig
[ ! -L ~/.gemrc      ] && ln -s $DOTFILES/.gemrc     ~/.gemrc

# TMUX
if [ ! -L ~/.tmux.conf ]; then
  ln -s $DOTFILES/.tmux.conf ~/.tmux.conf
fi
if [ ! -d $DOTFILES/.tmux/src/tmux-powerline ]; then
  git clone https://github.com/erikw/tmux-powerline.git $DOTFILES/.tmux/src/tmux-powerline
fi

#(refresh config file)
#tmux new -s test
#tmux source-file ~/.tmux.conf
#exit

# vim
[ ! -L ~/.vimrc      ] && ln -s $DOTFILES/.vimrc ~/.vimrc
[ ! -L ~/.vimrc.bundles      ] && ln -s $DOTFILES/.vimrc.bundles ~/.vimrc.bundles
[ ! -L ~/.gvimrc     ] && ln -s $DOTFILES/.gvimrc ~/.gvimrc

if [ ! -d $HOME/.vim/bundle ]; then
  mkdir -p $HOME/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +BundleInstall +qall

