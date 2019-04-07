"""""""""""""""""""
"""VUNDLE OPTIONS""
"""""""""""""""""""
set nocompatible              " be iMproved, required	
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
Plugin 'jalvesaq/Nvim-R'
Plugin 'swekaj/php-foldexpr.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'jpalardy/vim-slime'
Plugin 'ap/vim-buftabline'
Plugin 'chrisbra/csv.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/dbext.vim'

"enable tagbar
nmap <F8> :TagbarToggle<CR>

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"this line for enabling pathogen
"execute pathogen#infect()

""""""""""""""""""""""""""
"""VIM BEHAVIOUR OPTIONS""
""""""""""""""""""""""""""
set nu
set timeoutlen=1000 ttimeoutlen=0
set mouse=a
set encoding=utf-8
set backspace=2
set ttymouse=xterm2

set t_Co=256
syntax enable
let g:solarized_termtrans = 1    
"let g:solarized_termcolors=256                                                  
set background=dark
colorscheme solarized

so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
call togglebg#map("<F5>")

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

"""""""""""""""""""""""""""""""""
"""VIM PLUGIN BEHAVIOUR OPTIONS""
"""""""""""""""""""""""""""""""""
"slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_preserve_curpos = 1

"nvim_r
let R_term = 'terminator'
let R_in_buffer = 0
let R_applescript = 0
let R_tmux_split = 1
let R_assign = 0
let r_indent_align_args = 1
let r_indent_ess_comments = 1
let r_indent_ess_compatible = 1

"status line
set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
set laststatus=2

"shortcut for nerdtree
map <C-n> :NERDTreeToggle<CR>

"add stuff for buffer line
set hidden
nnoremap <C-E> :bnext<CR>

"tagbar
let g:tagbar_type_r = {
    \ 'ctagstype' : 'r',
    \ 'kinds'     : [
        \ 'f:Functions',
        \ 'g:GlobalVariables',
        \ 'v:FunctionVariables',
    \ ]
    \ }

"vimfugitive better colors
hi DiffAdd guifg=NONE ctermfg=NONE guibg=#464632 ctermbg=238 gui=NONE cterm=NONE
hi DiffChange guifg=NONE ctermfg=NONE guibg=#335261 ctermbg=239 gui=NONE cterm=NONE
hi DiffDelete guifg=#f43753 ctermfg=203 guibg=#79313c ctermbg=237 gui=NONE cterm=NONE
hi DiffText guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
