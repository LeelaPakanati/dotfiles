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

"""""""""""""""""""Notes""""""""""""""""""""""""""""""""
"
"   I use a controversial navigation in vim:
"       IJKL (like arrow keys) instead of HKJL
"       See navigation section for more details
"       Pros: 
"           It's what I like
"           Consistency with arrow keys
"
"       Cons:
"           Not consistent with everything else that uses 
"               VIM-based naviagion - need to reconfigure
"               other tools to work with IJKL
"
"   Tab/Split Workflow:
"       Due to Vim's notion of 'splits within tabs'
"       instead of the 'tabs within splits' that I prefer,
"       I don't use splits in my workflow, I instead just 
"       use different tmux panes for each 'split'
"
"       Pros:
"           It's what I like
"
"       Cons:
"           Must use tmux copy for copy between splits
"           instead of vim yank
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change leader to ","
let mapleader = ","

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
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'lervag/vimtex'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
Plugin 'KeitaNakamura/tex-conceal.vim'

call vundle#end()
filetype plugin indent on
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Cursed Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""" Tabs: like chrome/sublime:"""""""""""""""
nnoremap <C-t> :tabnext<CR> 
nnoremap <C-o> :RangerCurrentDirectoryNewTab<CR>
nnoremap <C-n> :tabnew 
nnoremap <C-w> :q<CR>
nnoremap <C-W> :q!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""Syntastic - linter""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0

"-- disable linter by default, turn on w/ <leader>s
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>s :SyntasticCheck<CR> :SyntasticToggleMode<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Useful Shortcuts""""""""""""""""""""""
"-- toggle minimap w/ <leader>m
nnoremap <leader>m :MinimapToggle<CR>

"-- Y to copy to end of line
nnoremap Y y$

" Fast saving
nnoremap <leader>w :w!<CR>

" Fast quitting
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>h :set hlsearch! hlsearch?<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""General Vim Setup""""""""""""""""""""""""
" typing behavior
set cursorline
set modeline
set autoindent
set expandtab
set softtabstop=4
set scrolloff=15
set esckeys
set number

set nocompatible
syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab

set autoread

"Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

set backspace=2 " make backspace work like most other programs

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Hybrid Relative Line Number""""""""""""""""""""""""""
:set number relativenumber

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""LaTeX setup""""""""""""""""""""
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
"""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""snippets setup"""""""""""""
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"""""""""""""""""""""""""""""""""""""""""""

""""""netrw browser settings"""""""""""""""
" no longer using netrw -> see ranger plugin
"let g:netrw_banner=0
"let g:netrw_banner_split=4
"let g:netrw_altv=1
"let g:netrw_lifestyle=3
"let g:netrw_list_hide=netrw_gitignore#Hide()
"""""""""""""""""""""""""""""""""""""""""""

""""""""""find files"""""""""""""""""""""""
filetype plugin indent on
set path+=**
set wildmenu
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""Being Extra"""""""""""""""""""""
" handling typos
source ~/.vimextras/typos.vim
"""""""""""""""""""""""""""""""""""""""""""

"""""""""""ETC"""""""""""""""""""""""""""""
let g:ranger_map_keys = 0
let g:livepreview_previewer = 'zathura'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
set background=dark " for the dark version

