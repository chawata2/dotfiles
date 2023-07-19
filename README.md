# dotfiles
```sh
git clone https://github.com/ChappieM/dotfiles.git
```


## Zsh
[Installing ZSH · ohmyzsh/ohmyzsh Wiki](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH)


```sh
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
```

### sheldon
[rossmacarthur/sheldon: :bowtie: Fast, configurable, shell plugin manager](https://github.com/rossmacarthur/sheldon#-installation)

Zshのプラグインマネージャとしてsheldonを使用

```sh
ln -s $HOME/dotfiles/config/sheldon/ $HOME/.config/sheldon
```

### asdf
[Getting Started | asdf](https://asdf-vm.com/guide/getting-started.html)

バージョン管理ツールはasdfを使用。

asdfを使用しない場合、.zshrcの該当箇所をコメントアウト。

### Welcome
Zsh起動時にcowsayを使ってなんか表示している。

```bash
vmstat | cowsay -n -f dragon | lolcat --force
```

不要であれば.zshrcの該当箇所をコメントアウト。
`cowsay`と`lolcat`が必要


## Wezterm
[WezTerm - Wez's Terminal Emulator](https://wezfurlong.org/wezterm/index.html)

ターミナルエミュレーター。ターミナルマルチプレクサを兼ねている。

ssh接続して使用する場合、ホストにもインストールするといい。

[多重化 - Wez のターミナル エミュレータ](https://wezfurlong.org/wezterm/multiplexing.html#ssh-domains)

```sh
ln -s $HOME/dotfiles/config/wezterm/ $HOME/.config/wezterm
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
ln -s $HOME/dotfiles/config/nvim/ $HOME/.config/nvim
```

### Packer

[wbthomason/packer.nvim: A use-package inspired plugin manager for Neovim. Uses native packages, supports Luarocks dependencies, written in Lua, allows for expressive config](https://github.com/wbthomason/packer.nvim)

```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
