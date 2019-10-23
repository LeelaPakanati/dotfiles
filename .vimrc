""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"       _
"__   _(_)_ __ ___  _ __ ___
"\ \ / / | '_ ` _ \| '__/ __|
" \ V /| | | | | | | | | (__
"  \_/ |_|_| |_| |_|_|  \___|
"
" Leela Pakanati 
" This is a living document of my vim configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""VUNDLE"""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'vim-airline/vim-airline'

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

" change leader to ","
let mapleader = ","

"""""""""""""""Syntastic - linter"""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0

"-- disable linter by default, turn on w/ <leader>s
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>s :SyntasticCheck<CR> :SyntasticToggleMode<CR>
""""""""""""""""""""""""""""""""""""""""""

"-- toggle minimap w/ <leader>m
nnoremap <leader>m :MinimapToggle<CR>

"-- Y to copy to end of line
nnoremap Y y$

"""""""""""browser settings"""""""""""""""
let g:netrw_banner=0
let g:netrw_banner_split=4
let g:netrw_altv=1
let g:netrw_lifestyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()
"""""""""""""""""""""""""""""""""""""""""""

""""""""""find files"""""""""""""""""""""""
filetype plugin indent on
set path+=**
set wildmenu
"""""""""""""""""""""""""""""""""""""""""""

" typing behavior
set cursorline
set modeline
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set scrolloff=15
set esckeys
set number

set nocompatible
syntax on
filetype plugin on

" navigation with ijkl or mouse, insert with ;, escape with ,, 
noremap ; i
noremap l l
noremap i k
noremap k j
noremap j h
imap ,, <Esc>
xmap ,, <ESC> 
set mouse=a

"use ctrl+direction for words
noremap <C-l> w
noremap <C-j> B
noremap ' o
noremap o <C-d>
noremap u <C-u>
noremap <C-u> u
imap <C-u> <C-w>

"Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Fast saving
nmap <leader>w :w!<CR>

" Fast quitting
nmap <leader>q :q<CR>
nmap <leader>Q :q!<CR>
nmap <leader>x :x<CR>

""""""""""""""""""" Tabs: like chrome/sublime:"""""""""""""""""""""
nnoremap <C-t> :tabnext<CR> 
nnoremap <C-o> :Tex<CR>
nnoremap <C-n> :tabnew 
nnoremap <C-w> :q<CR>
nnoremap <C-W> :q!<CR>

set backspace=2 " make backspace work like most other programs

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

""""""""""""""""Hybrid Relative Line Number""""""""""""""""""""""""""
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif
set background=dark " for the dark version

