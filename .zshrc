source ~/.profile
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
bindkey -e

# cd
setopt auto_pushd
setopt auto_cd
setopt pushd_ignore_dups

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
#bindkey '^R' history-incremental-pattern-search-backward
#bindkey '^S' history-incremental-pattern-search-forward

# ls color
export LSCOLORS=gxfxxxxxcxxxxxxxxxgxgx
export LS_COLORS='di=01;36:ln=01;35:ex=01;32'
zstyle ':completion:*' list-colors 'di=36' 'ln=35' 'ex=32'

# alcでキーワード検索
function alc() {
  if [ $# != 0 ]; then
    w3m "http://eow.alc.co.jp/$*/UTF-8/?ref=sa"
  else
    w3m "http://www.alc.co.jp/"
  fi
}

# googleで（ｒｙ
function go() {
  if [ $# != 0 ]; then
    w3m "http://www.google.co.jp/search?aq=f&sourceid=chrome&ie=UTF-8&q=$*"
  else
    w3m "http://www.google.co.jp"
  fi
}

# ;zでzshrcを反映
function ;z() {
  source ~/.zshrc
}

# プロンプト
autoload colors
colors
PROMPT="%{${fg[cyan]}%}[%n@%m]%(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[white]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[yellow]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${fg[yellow]}%}[%~]%{${reset_color}%}"

# plugins
source ~/.zsh/plugin/incr*.zsh
