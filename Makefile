DOTFILES=gitconfig \
		 screenrc \
		 vimrc \
		 zshrc

all:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] || ln -s $(PWD)/$(dotfile) ~/.$(dotfile);)
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugUpdate +qa
	dconf load /com/gexperts/Tilix/ < tilix.dconf

clean:
	@$(foreach dotfile, $(DOTFILES), \
		[ -f ~/.$(dotfile) ] && rm -f ~/.$(dotfile);)
	rm -rf ~/.vim

.PHONY: all
