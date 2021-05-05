" === Vundle Setup === "

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" === All Plugins === "
" To uninstall plugin:
" (1) Remove in ~/.vim/bundle/
" (2) Run :PluginInstall

" - Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'
" - Syntax checking
Plugin 'vim-syntastic/syntastic'
" - Auto-closing pair symbols
Plugin 'jiangmiao/auto-pairs'
" - Status line customization
Plugin 'itchyny/lightline.vim'
" - Easy auto-commenter
Plugin 'preservim/nerdcommenter'
" - Code completion
Plugin 'neoclide/coc.nvim'
" - File explorer
Plugin 'preservim/nerdtree'

call vundle#end()
filetype plugin indent on

" === MAPPINGS === "

let mapleader = "\<Space>"

" === DEFAULT CONFIG === "

" - Change cursor on insert mode
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"
" - Set faster escape timeout delay
set ttimeoutlen=50
" - Set dark background
set background=dark
" - Enable syntax highlighting
syntax on
" - Enable 256 color set
set t_Co=256
" - Set GUI font and size
set guifont=Courier:h14
" - Set color scheme
colorscheme gruvbox
" - Removes the colorscheme background in Terminal (Optional)
if !has("gui_running")
	highlight Normal ctermbg=NONE guibg=NONE
endif
" - Allow backspace
set backspace=indent,eol,start
" - Tab size
set tabstop=4
" - Auto-indent size
set shiftwidth=4
" - Enable line numbering
set number
" - Ensure utf-8 encoding
set encoding=utf-8

" === PLUGIN lightline.vim CONFIG === "

" - Keep status line always visible
set laststatus=2
" - Hide default mode status
set noshowmode
" - Setup scheme
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ }

" === PLUGIN coc.nvim CONFIG === "

" - External source config file
source ~/.vim/sources/coc-config.vim 
" - All CoC extension
let g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-clangd']

" === PLUGIN NERDTree.nvim CONFIG === "

" - Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" - Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

