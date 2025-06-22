# dotfiles

## セットアップ

各設定ファイルのシンボリックリンクを作成する：

```sh
# alacritty
ln -s $HOME/dotfiles/alacritty/ $HOME/.config/alacritty

# tmux
ln -s $HOME/dotfiles/tmux/ $HOME/.config/tmux

# zsh
ln -s $HOME/dotfiles/zsh/.zshrc $HOME/.zshrc

# sheldon
ln -s $HOME/dotfiles/sheldon/ $HOME/.config/sheldon
```

## sheldon
[rossmacarthur/sheldon: :bowtie: Fast, configurable, shell plugin manager](https://github.com/rossmacarthur/sheldon#-installation)

Zshのプラグインマネージャとしてsheldonを使用

環境固有の設定は`$HOME/.local.zsh`に記述する。


## Alacrittyのテーマをダウンロード

https://github.com/alacritty/alacritty-theme


```sh
# We use Alacritty's default Linux config directory as our storage location here.
mkdir -p ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
```
