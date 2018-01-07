export ZSH=$HOME/.oh-my-zsh

DISABLE_AUTO_UPDATE="true"
plugins=(git rails rake)
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:$HOME/.local/bin:$HOME/bin:$HOME/.rvm/bin"
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY=$(tty)

# some helpful aliases
alias grep="grep --color=auto"
alias -g G='|grep'
alias -g L='|less'
alias -g T='|tail'
alias -g V='|vim'

alias pks=". ~/.zshrc"
alias ws="python -m SimpleHTTPServer"

# ctags for ruby project
alias rtags="ctags -R --languages=ruby --exclude=.git --exclude=log ."

function chpwd() {
  emulate -LR zsh
  ls
}

function dsh() {
  sed -i ${1}d ~/.ssh/known_hosts
}

export VAGRANT_DEFAULT_PROVIDER=libvirt

# FZF
[ -f /usr/share/fzf/shell/key-bindings.zsh ] && source /usr/share/fzf/shell/key-bindings.zsh

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/zsh/powerline.zsh
fi
