#!/bin/bash
set -e


if [ ! -d "$HOME"/.config ]; then
  mkdir "${HOME}"/.config
fi

ln -vfsn $HOME/dotfiles/vimrc $HOME/.vimrc
ln -vfsn $HOME/dotfiles/zshrc $HOME/.zshrc
ln -vfsn $HOME/dotfiles/sheldon $HOME/.config/
