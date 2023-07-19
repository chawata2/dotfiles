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
comming soon
