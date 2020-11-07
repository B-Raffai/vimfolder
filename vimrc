set nocompatible              " required for Vundle
filetype off                  " required for Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ycm-core/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required for Vundle
filetype plugin indent on    " required for Vundle

set nu
" show line numbers relative to current line
set relativenumber

set cursorline
set wildmenu

" solarized stuff
syntax enable
set background=light
colorscheme solarized

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" show vertical line at column 80
set colorcolumn=80
" search in all subfolders for files
set path+=**
" scroll before hitting bottom of window
set scrolloff=5

let mapleader=","

" word count on selection
xnoremap <leader>w <esc>:'<,'>:w !wc -w<CR>

" hide ycm live compilation warnings
" let g:ycm_show_diagnostics_ui = 0
" don't do automatic #include header 
let g:ycm_clangd_args = [ '--header-insertion=never' ]
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
"jump to definition
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>

"autoformat with clang-format 
"https://clang.llvm.org/docs/ClangFormat.html
noremap <leader>f :py3file /usr/share/clang/clang-format.py<cr>

set foldmethod=syntax
" only fold extremely deep folds automatically
set foldlevelstart=10

" spell checker highlighting
hi SpellBad cterm=underline
hi SpellCap cterm=bold
hi SpellRare cterm=bold
hi SpellLocal cterm=bold

" for gnome-terminal spellcheck
let &t_Cs = "\e[4:3m"
let &t_Ce = "\e[4:0m"
hi SpellBad     gui=undercurl guisp=red term=undercurl cterm=undercurl
