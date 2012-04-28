export DOTFILES=path/to/dotfiles

source $DOTFILES/.zsh/basic.zshrc
source $DOTFILES/.zsh/history.zshrc

[ -f $DOTFILES/office/.zshrc ] && source $DOTFILES/office/.zshrc

[ -f $DOTFILES/home/.zshrc ] && source $DOTFILES/home/.zshrc

[ -f $DOTFILES/.zsh/oh-my-zsh.zshrc ] && source $DOTFILES/.zsh/oh-my-zsh.zshrc

export PATH=$PATH