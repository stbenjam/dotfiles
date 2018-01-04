export ZSH=$HOME/.oh-my-zsh

# Smiley prompt
RPROMPT='%(?,%F{green}:%),%F{yellow}%? %F{red}:()%f'

# Oh my ZSH settings
ZSH_THEME="gentoo"
DISABLE_AUTO_UPDATE="true"
plugins=(git)
source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/home/stbenjam/.local/bin:/home/stbenjam/bin"
export LANG=en_US.UTF-8
export EDITOR='vim'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GPG_TTY=$(tty)

PERL_MB_OPT="--install_base \"/home/stbenjam/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/stbenjam/perl5"; export PERL_MM_OPT;

# some helpful aliases
alias grep="grep --color=auto"
alias -g G='|grep'
alias -g L='|less'
alias -g T='|tail'
alias -g V='|vim'

alias pks=". ~/.zshrc"
alias cob="git branch | cut -c 3- | selecta | xargs git checkout"
alias ws="python -m SimpleHTTPServer"
alias dj="python manage.py runserver"
alias rs="rails s"

function chpwd() {
  emulate -LR zsh
  ls
}

function dsh() {
  sed -i ${1}d ~/.ssh/known_hosts
}

go() {
  if [ -z $1 ];
  then
    FILES=$(find ~/git ~/sat6 -maxdepth 1 -type d)
  else
    FILES=$(find ~/git ~/sat6 -maxdepth 1 -type d | grep $*)
  fi
  cd $(echo $FILES | selecta)
}

# By default, ^S freezes terminal output and ^Q resumes it. Disable that so
# that those keys can be used for other things.
unsetopt flowcontrol
# Run Selecta in the current working directory, appending the selected path, if
# any, to the current command.
function insert-selecta-path-in-command-line() {
    local selected_path
    # Print a newline or we'll clobber the old prompt.
    echo
    # Find the path; abort if the user doesn't select anything.
    selected_path=$(find * -type f | selecta) || return
    # Append the selection to the current command buffer.
    eval 'LBUFFER="$LBUFFER$selected_path"'
    # Redraw the prompt since Selecta has drawn several new lines of text.
    zle reset-prompt
}
# Create the zle widget
zle -N insert-selecta-path-in-command-line
# Bind the key to the newly created widget
bindkey "^S" "insert-selecta-path-in-command-line"

export VAGRANT_DEFAULT_PROVIDER=libvirt
#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/zsh/powerline.zsh
fi
