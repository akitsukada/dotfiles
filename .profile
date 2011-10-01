export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls='ls -G'
alias la='ls -la'
alias ll='ls -l'
alias r='rails'
alias pu='phpunit'
alias javac="javac -J-Dfile.encoding=UTF8"

# MacPorts Installer addition on 2011-05-05_at_10:31:31: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

# lha
export PATH=${HOME}/BIN/Lha/bin:${PATH}

# vim
alias vim='/usr/bin/vim'
export EDITOR=vim

# svn
export SVN_EDITOR='/usr/bin/vim'

# rvm
if [[ -s $HOME/.rvm/scripts/rvm ]] then
  source $HOME/.rvm/scripts/rvm
fi

# nvm
. ~/.nvm/nvm.sh

# node
export NODE_PATH=$NODE_PATH:/usr/local/lib/node_modules
