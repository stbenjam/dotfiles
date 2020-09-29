"""""" Plugins
set nocompatible
filetype off

call plug#begin()

" Rainbow brackets/braces
Plug 'luochen1990/rainbow'
Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'

" Lots of languages
Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/syntastic'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Ruby stuff
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'

" Tab completion
Plug 'ervandew/supertab'

" YAML
Plug 'stephpy/vim-yaml'
Plug 'pearofducks/ansible-vim'

" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

filetype plugin indent on
set laststatus=2
let g:Powerline_symbols = "fancy"
set t_co=256
let g:rainbow_active = 1


"" Window stuff

" control + vim direction key to navigate windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" control + arrow key to navigate windows
noremap <C-Down> <C-W>j
noremap <C-Up> <C-W>k
noremap <C-Left> <C-W>h
noremap <C-Right> <C-W>l

" Misc
let mapleader = ","
set ts=2
set sw=2
set incsearch
set ruler
set expandtab
set autoindent
set visualbell
set numberwidth=1
set number
autocmd FileType ruby setl sw=2 sts=2 et
autocmd FileType ruby setl sw=2 sts=2 et
autocmd FileType yaml set cursorcolumn
autocmd BufWritePre *.go GoFmt

augroup gitsetup
  autocmd!

  " Only set these commands up for git commits
   autocmd FileType gitcommit
   autocmd CursorMoved,CursorMovedI * let &l:textwidth = line('.') == 1 ? 50 : 72
augroup end

colorscheme torte
syntax enable
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

" Deal with trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
au BufRead,BufNewFile *.pp        set filetype=puppet
