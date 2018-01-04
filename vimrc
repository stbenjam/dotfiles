"""""" Plugins
set nocompatible
filetype off

call plug#begin()

" Rainbow brackets/braces
Plug 'luochen1990/rainbow'

Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" Lots of languages
Plug 'sheerun/vim-polyglot'

" Git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/syntastic'
Plug 'tpope/vim-rails'

Plug 'ervandew/supertab'


call plug#end()

filetype plugin indent on
set laststatus=2
let g:Powerline_symbols = "fancy"
set t_co=256
let g:rainbow_active = 1

" Misc
let mapleader = ","
set ts=4
set sw=4
set incsearch
set ruler
set expandtab
set autoindent
set visualbell
set numberwidth=1
autocmd FileType ruby setl sw=2 sts=2 et
autocmd FileType ruby setl sw=2 sts=2 et
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

" SELECTA
" Run a given vim command on the results of fuzzy selecting from a given shell
" command. See usage below.
function! SelectaCommand(choice_command, selecta_args, vim_command)
  try
    silent let selection = system(a:choice_command . " | selecta " . a:selecta_args)
  catch /Vim:Interrupt/
   " Swallow the ^C so that the redraw below happens; otherwise there will be
   " leftovers from selecta on the screen
    redraw!
     return
   endtry
   redraw!
   exec a:vim_command . " " . selection
endfunction

" Find all files in all non-dot directories starting in the working directory.
" Fuzzy select one of those. Open the selected file with :e.
nnoremap <leader>f :call SelectaCommand("find * -type f", "", ":e")<cr>
