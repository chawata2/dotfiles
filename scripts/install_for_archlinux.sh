#!/bin/sh
set -e

sudo pacman --noconfirm -Syyu

sudo pacman --noconfirm -S neovim \
	git \
	zsh \
	ripgrep \
    curl \
	tmux \
	cowsay \

# mason.nvim may require
sudo pacman --noconfirm -S nodejs \
	npm \
	python3 \
	python-pip

# Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim

# Sheldon
curl --proto '=https' -fLsS https://rossmacarthur.github.io/install/crate.sh \
	| bash -s -- --repo rossmacarthur/sheldon --to ~/.locln -s $HOME/dotfiles/sheldon/ $HOME/.config/sheldonal/bin
