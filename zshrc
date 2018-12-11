export ZSH=$HOME/.oh-my-zsh
export GIT=/bin/git

DISABLE_AUTO_UPDATE="true"
plugins=(git rails rake gpg-agent zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

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
alias gpg="gpg2"

# ctags for ruby project
alias rtags="ctags -R --languages=ruby --exclude=.git --exclude=log ."

function chpwd() {
  emulate -LR zsh
  ls
}

function dsh() {
  sed -i ${1}d ~/.ssh/known_hosts
}

# cd after git clone
function git() {
   local tmp=$(mktemp)
   local repo_dir

   if [ "$1" = clone ]
   then
     $GIT "$@" --progress 2>&1 | tee $tmp
     repo_dir=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
     rm $tmp
     echo "Changing to directory $repo_dir"
     cd "$repo_dir"
   else
     $GIT "$@"
   fi
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
