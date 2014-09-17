#!/bin/sh

#Remove files if they exist and store in backup folder
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
if [ -d ~/.vim ]; then
  rm -rf ~/.vim/ 
fi
if [ -f ~/.zshrc ]; then
  rm -rf ~/.zshrc
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

# vim
[ ! -L ~/.vimrc      ] && ln -s $DOTFILES/.vimrc ~/.vimrc
[ ! -L ~/.gvimrc     ] && ln -s $DOTFILES/.gvimrc ~/.gvimrc

if [ ! -d $HOME/.vim/bundle ]; then
  mkdir -p $HOME/.vim/bundle
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +BundleInstall +qall

# zsh
if [ ! -d $DOTFILES/.zsh/src/zsh-completions ]; then
  git clone git://github.com/zsh-users/zsh-completions.git $DOTFILES/.zsh/src/zsh-completions
fi
if [ ! -d $DOTFILES/.zsh/src/oh-my-zsh ]; then
    git clone git://github.com/robbyrussell/oh-my-zsh.git $DOTFILES/.zsh/src/oh-my-zsh
fi
if [ ! -L ~/.zshrc ]; then
    ln -s $DOTFILES/.zshrc ~/.zshrc
fi

