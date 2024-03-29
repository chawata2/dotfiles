# dotfiles
```sh
git clone https://github.com/ChappieM/dotfiles.git ~/dotfiles
```

## Zsh
[Installing ZSH · ohmyzsh/ohmyzsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)


```sh
ln -s $HOME/dotfiles/zshrc $HOME/.zshrc
```

### sheldon
[rossmacarthur/sheldon: :bowtie: Fast, configurable, shell plugin manager](https://github.com/rossmacarthur/sheldon#-installation)

Zshのプラグインマネージャとしてsheldonを使用

環境固有の設定は`zsh/local.zsh`に記述する。

```sh
ln -s $HOME/dotfiles/sheldon/ $HOME/.config/sheldon
```

### asdf
[Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)

バージョン管理ツールはasdfを使用。

asdfを使用しない場合、.zshrcの該当箇所をコメントアウト。


## Wezterm
[WezTerm - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/index.html)

ターミナルエミュレーター。ターミナルマルチプレクサを兼ねている。

ssh接続して使用する場合、ホストにもインストールする。

[多重化 - Wez のターミナル エミュレータ](https://wezfurlong.org/wezterm/multiplexing.html#ssh-domains)

```sh
ln -s $HOME/dotfiles/wezterm/ $HOME/.config/wezterm
```

環境固有の設定は`config/wezterm/local.lua`に記述する。

## Vim

```sh
ln -s $HOME/dotfiles/vim/ $HOME/.config/nvim
```

## NeoVim
[Installing Neovim · neovim/neovim Wiki](https://github.com/neovim/neovim/wiki/Installing-Neovim)

インストール例

```sh
sudo apt install -y curl git ripgrep tar unzip wget build-essential

sudo wget https://github.com/neovim/neovim/releases/download/v0.9.1/nvim-linux64.tar.gz && \
    tar -zxvf nvim-linux64.tar.gz && \
    mv nvim-linux64/bin/nvim usr/bin/nvim && \
    mv nvim-linux64/lib/nvim usr/lib/nvim && \
    mv nvim-linux64/share/nvim/ usr/share/nvim && \
    rm -rf nvim-linux64 && \
    rm nvim-linux64.tar.gz
```

```sh
ln -s $HOME/dotfiles/nvim/ $HOME/.config/nvim
```

### Packer

[wbthomason/packer.nvim: A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config](https://github.com/wbthomason/packer.nvim)

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

環境固有の設定は`config/nvim/lua/local/config.lua`に記述する。

## Gitconfig
`~/.gitconfig`に以下を追記する


```
[include]
  path = ~/dotfiles/git/gitconfig.alias
```

## open-devcontainer
[Shane Friedman / open-devcontainer · GitLab](https://gitlab.com/smoores/open-devcontainer#lifecycle-scripts)


```sh
ln -s $HOME/dotfiles/odc.json $HOME/.config/
```

## Tmux

```bash
ln -vfsn $HOME/dotfiles/tmux $HOME/.config/
```

## i3-wm
```bash
ln -vfsn $HOME/dotfiles/i3 $HOME/.config/
```
