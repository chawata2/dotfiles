if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=$HOME/.zsh-history # 履歴を保存するファイル
HISTSIZE=100000             # メモリ上に保存する履歴のサイズ
SAVEHIST=1000000            # 上述のファイルに保存する履歴のサイズ

setopt inc_append_history   # 実行時に履歴をファイルにに追加していく
setopt share_history        # 履歴を他のシェルとリアルタイム共有する
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks

autoload -Uz compinit && compinit

# 補完候補をそのまま探す -> 小文字を大文字に変えて探す -> 大文字を小文字に変えて探す
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

### 補完方法毎にグループ化する。
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

### 補完侯補をメニューから選択する。
### select=2: 補完候補を一覧から選択する。補完候補が2つ以上なければすぐに補完する。
zstyle ':completion:*:default' menu select=2

setopt auto_cd

# disable ctrl+s, ctrl+q
setopt no_flow_control

export EDITOR="vim"

# git-promptの読み込み
source ~/dotfiles/zsh/git-prompt.sh

# git-completionの読み込み
fpath=(~/.zsh $fpath)
zstyle ':completion:*:*:git:*' script ~/dotfiles/zsh/git-completion.bash
autoload -Uz compinit && compinit

GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto

setopt PROMPT_SUBST ; PS1='
%F{34}%n@%m%f: %F{cyan}%~%f %F{red}$(__git_ps1 "(%s)")%f
\$ '

# ssh-agent
if [ $(ps aux | grep ssh-agent | grep -v grep | wc -l) -eq 0 ]; then
    rm -f /tmp/ssh-agent.sock
    eval $(ssh-agent -a /tmp/ssh-agent.sock) &> /dev/null
    ssh-add ~/.ssh/id_ed25519  &> /dev/null
else
    export SSH_AUTH_SOCK=/tmp/ssh-agent.sock;
    export SSH_AGENT_PID=$(pidof ssh-agent);
fi

export FZF_DEFAULT_OPTS='--height 50% --reverse --border'

# fzf history
function fzf-select-history() {
    BUFFER=$(history -n -r 1 | fzf --query "$LBUFFER" --reverse)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-select-history
bindkey '^r' fzf-select-history

# local settings.
if [ -f ~/.local.zsh ]; then
  source ~/.local.zsh
fi

alias ls='ls --color=auto'
alias vi='vim'
alias lg='lazygit'
alias dc='docker compose'

eval "$(sheldon source)"
