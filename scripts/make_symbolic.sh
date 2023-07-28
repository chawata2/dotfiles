#!/bin/bash
set -e


if [ ! -d "$HOME"/.config ]; then
  mkdir "${HOME}"/.config
fi

ln -vfsn $HOME/dotfiles/nvim $HOME/.config/
ln -vfsnb $HOME/dotfiles/zshrc $HOME/.zshrc
ln -vfsn $HOME/dotfiles/sheldon $HOME/.config/
ln -vfsn $HOME/dotfiles/evremap $HOME/.config/
ln -vfsn $HOME/dotfiles/odc.json $HOME/.config/
