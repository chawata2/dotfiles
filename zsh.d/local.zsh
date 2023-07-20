# asdf
. "$HOME/.asdf/asdf.sh"
fpath=($HOME/.asdf/completions $fpath)
autoload -Uz compinit && compinit

# welcome
# vmstat | cowsay -n -f dragon | lolcat --force
figlet "on Lubuntu!" | cowsay -n -f dragon | lolcat --force
