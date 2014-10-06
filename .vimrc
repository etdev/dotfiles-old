set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme peachpuff

set t_Co=256

"VUNDLE
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"set rtp+=$DOTFILES/.vim/vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Bundle 'JulesWang/css.vim'
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'rainbow_parentheses.vim'
Bundle 'YankRing.vim'
Bundle 'taglist.vim'
Bundle 'taglist-plus'
Bundle 'AndrewRadev/switch.vim'
Bundle 'endwise.vim'
Bundle 'mileszs/ack.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'nvie/vim-flake8'
Bundle 'scrooloose/syntastic'
Bundle 'mustache/vim-mustache-handlebars'
Bundle 'slim-template/vim-slim.git'

" All of your Plugins must be added before the following line
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

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"------------------------------
""" basic
"------------------------------
let mapleader = ","

set list
set number
set nopaste
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
map <F4> :set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%<CR><Esc>
map <F5> :set listchars=""<CR><ESC>
map <F6> :TlistToggle<CR>

" remove spaces at line end
autocmd BufWritePre * :%s/\s\+$//ge

"------------------------------
""" indent
"------------------------------
"set noautoindent
set tabstop=2
set shiftwidth=2
set expandtab
set showtabline=2

"------------------------------
""" tab
"------------------------------
map  <C-t><C-n> :tabnew<CR>
map  <C-t><C-w> :tabclose<CR>
map  <C-t><C-t> :tabn<CR>
map  <C-t><C-p> :tabp<CR>

"------------------------------
""" highlight
"------------------------------
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"------------------------------
""" statusline
"------------------------------
set ruler
set laststatus=2
" statusline color normal/insert mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

"------------------------------
""" Language
"------------------------------
syntax enable
augroup filetypedetect
    " Detect .txt as 'text'
    autocmd! BufNewFile,BufRead *.py  setfiletype python
    autocmd! BufNewFile,BufRead *.txt setfiletype text
augroup END

if !exists('loaded_matchit')
  runtime macros/matchit.vim
end

" NORMAL MODE
nnoremap - :Switch<CR>

" taglist
let Tlist_Show_One_File=1
let Tlist_Sort_Type='order'
let Tlist_GainFocus_On_ToggleOpen=1
let Tlist_File_Fold_Auto_Close=1
let Tlist_Use_Left_Window=1
let Tlist_WinWidth=50
"let Tlist_Use_Horiz_Window=1
"let Tlist_WinHeight=10

" Flake8
let g:flake8_ignore="E501,E128,E124,E221"

" Various
set ignorecase
set smartcase
set autoindent
set nostartofline
set confirm
set visualbell
set t_vb=
set mouse=a
"set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
nnoremap <C-L> :nohl<CR><C-L>

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" NERDTree
autocmd VimEnter * NERDTree
autocmd BUFEnter * NERDTreeMirror
autocmd VimEnter * wincmd p
let NERDTreeWinSize = 26

set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set backspace=2

" Prevent auto comment insertion
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
let g:hybrid_use_iTerm_colors = 1
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
au BufRead *.html set filetype=htmlm4
let g:yankring_history_dir = '~/.vim/'
