export ZSH=$HOME/.oh-my-zsh
export GIT=/bin/git

setopt +o nomatch

DISABLE_AUTO_UPDATE="true"
plugins=(git rails rake gpg-agent zsh-autosuggestions zsh-syntax-highlighting golang)
source $ZSH/oh-my-zsh.sh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=white'

export GOPATH=$HOME/go
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:$HOME/.local/bin:$HOME/bin:$HOME/.rvm/bin:$GOPATH/bin"
export LANG=en_US.UTF-8
export EDITOR='vim'
export GPG_TTY=$(tty)
export CONTAINER_ENGINE=podman
export VAGRANT_DEFAULT_PROVIDER=libvirt

# don't pollute cwd when extracting
export TAR_OPTIONS="--one-top-level"

# some helpful aliases
alias grep="grep --color=auto"
alias -g G='|grep'
alias -g L='|less'
alias -g T='|tail'
alias -g V='|vim'

alias pks=". ~/.zshrc"
alias gpg="gpg2"

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
     shift 1
     $GIT clone-fork "$@" 2>&1 | tee $tmp
     repo_dir=$(awk -F\' '/Cloning into/ {print $2}' $tmp)
     rm $tmp
     echo "Changing to directory $repo_dir"
     cd "$repo_dir"
   else
     $GIT "$@"
   fi
}

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  [ -f /usr/share/powerline/zsh/powerline.zsh ] && source /usr/share/powerline/zsh/powerline.zsh
  [ -f $HOME/.local/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh ] && source $HOME/.local/lib/python*/site-packages/powerline/bindings/zsh/powerline.zsh
fi
