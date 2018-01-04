# the following make file is based on the idea from
# https://github.com/fatih/dotfiles/blob/master/Makefile

DOTFILES := $(shell find $(PWD) -maxdepth 1 ! -iname Makefile ! -iname .git ! -iname dotfiles -printf "%f\n")

all:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] || ln -s $(PWD)/$(dotfile) ~/.$(dotfile);)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugUpdate +qa

clean:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] && rm -f ~/.$(dotfile);)
	rm -rf ~/.vim

.PHONY: all
