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
Plugin 'vim-airline/vim-airline'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'francoiscabrol/ranger.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
"Plugin 'prabirshrestha/vim-lsp'
Plugin 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
"Plugin 'prabirshrestha/asyncomplete.vim'
"Plugin 'prabirshrestha/asyncomplete-lsp.vim'

call vundle#end()
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

source ~/.vimextras/lsp.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
"               Cursed Navigation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap ; i
noremap l l
noremap i k
noremap k j
noremap j h
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

""""""""""""""""General Vim Setup""""""""""""""""""""""""
" typing behavior
set cursorline
set modeline
set autoindent
set expandtab
set softtabstop=4
set scrolloff=15
set number
set switchbuf=newtab

set nocompatible
syntax on

" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4

set autoread

"Sets how many lines of history VIM has to remember
set history=500

" Enable filetype plugins
filetype plugin on
filetype indent on

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

set completeopt-=preview
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Hybrid Relative Line Number""""""""""""""""""""""""""
set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""" Tabs: like chrome/sublime:"""""""""""""""
nnoremap <C-t> :tabnext<CR> 
nnoremap <C-o> :RangerCurrentDirectoryNewTab<CR>
nnoremap <C-n> :tabnew 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""" Split current buffer into split and navigate"""""
nnoremap <C-h> :sp<CR>
nnoremap <C-i> <C-W>k
nnoremap <C-k> <C-W>j
"""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""Being Extra"""""""""""""""""""""
" handling typos
source ~/.vimextras/typos.vim
source ~/.vimextras/comments.vim
"""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""Useful Shortcuts""""""""""""""""""""""
"-- toggle minimap w/ <leader>m
nnoremap <leader>m :MinimapToggle<CR>

"-- Y to copy to end of line
nnoremap Y y$
"-- C-c copy to systemc cipboard
vmap <C-c> "+y

" Fast save
nnoremap <leader>w :w!<CR>

" Fast quitting
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :q!<CR>
nnoremap <leader>x :x<CR>

nnoremap <leader>h :set hlsearch! is! hlsearch?<CR>

" nnoremap <leader>default :so ~/.defaultnav.vim<CR>

set pastetoggle=<leader>p

nnoremap <leader>/ :call ToggleComment()<CR>

nnoremap <leader>d yy:call ToggleComment()<CR><ESC>p
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""VIM Futitive for GIT"""""""""""""""""""""""
let g:fzf_action = {
  \ 'ctrl-m': 'tabedit',
  \ 'ctrl-o': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'ctrl-h':  'botright split',
  \ 'ctrl-v':  'vertical botright split' }
nnoremap <C-g> :Files<CR>
nnoremap <C-f> :Ag!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""VIM Futitive for GIT"""""""""""""""""""""""
let g:gitgutter_enabled  =0
nnoremap <leader>gs :G<CR>
nnoremap <leader>gg :GitGutterToggle<CR>
nnoremap <leader>gh :GitGutterStageHunk<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""snippets setup"""""""""""""
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"""""""""""""""""""""""""""""""""""""""""""

""""""""""find files"""""""""""""""""""""""
set path+=**
set wildmenu
"""""""""""""""""""""""""""""""""""""""""""
"""""""""""ETC"""""""""""""""""""""""""""""
let g:ranger_map_keys = 0
let g:livepreview_previewer = 'zathura'
"let g:lsp_fold_enabled = 0
"let g:lsp_semantic_enabled = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Credit joshdick
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
colorscheme default
set background=dark " for the dark version

