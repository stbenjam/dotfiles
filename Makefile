SHELL := /bin/bash

DOTFILES=gitconfig \
				 gitignore \
				 profile \
				 screenrc \
				 vimrc \
				 zshrc

PACKAGES=vim-enhanced \
				 tmux \
				 zsh \
				 git \

GCC_PACKAGES=gcc

all: epel packages gcc go git ohmyzsh dotfiles
default: all

dotfiles:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] || ln -s $(PWD)/$(dotfile) ~/.$(dotfile);)
	mkdir -p ~/.config/i3/
	ln -s $(PWD)/i3-config ~/.config/i3/config || true
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	#vim +PlugUpdate +qa
	(which dconf 2>&1 && dconf load /com/gexperts/Tilix/ < tilix.dconf) > /dev/null || true

packages:
	sudo yum install -y $(PACKAGES)

epel:
	./scripts/epel.sh

gcc:
	sudo yum install -y $(GCC_PACKAGES)

git:
	go get -u github.com/stbenjam/git-clone-fork

go:
	./scripts/golang.sh

ohmyzsh:
	[ -d $(HOME)/.oh-my-zsh ] || curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

sshkey:
	[ -d $(HOME)/.ssh ] || mkdir -p $(HOME)/.ssh
	chmod 700 $(HOME)/.ssh
	curl -sSL https://github.com/stbenjam.keys > $(HOME)/.ssh/authorized_keys
	chmod 600 $(HOME)/.ssh/authorized_keys

clean:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] && rm -f ~/.$(dotfile);)
	rm -rf ~/.vim

.PHONY: all dotfiles packages epel gcc go
