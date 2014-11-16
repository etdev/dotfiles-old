set encoding=utf-8
set nocompatible              " be iMproved, required
filetype off                  " required
colorscheme default

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
Bundle 'tpope/vim-rails.git'
Bundle 'tpope/vim-bundler.git'
Bundle 'JulesWang/css.vim'
"Snipmate
Bundle 'tomtom/tlib_vim.git'
Bundle 'MarcWeber/vim-addon-mw-utils.git'
Bundle 'garbas/vim-snipmate.git'
Bundle 'honza/vim-snippets.git'
"
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'kien/rainbow_parentheses.vim'
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
Bundle 'kien/ctrlp.vim'
Bundle 'Shougo/unite.vim'
Bundle 'thoughtbot/vim-rspec'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

"------------------------------
""" basic
"------------------------------
let mapleader = ","

"set list
set number
set nopaste
"set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set backspace=indent,eol,start
map <F4> :set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%<CR><Esc>
map <F5> :set listchars=""<CR><ESC>
map <F6> :TlistToggle<CR>

" remove spaces at line end
autocmd BufWritePre * :%s/\s\+$//ge

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
    autocmd! BufNewFile,BufRead *.html.erb  setfiletype html
    autocmd! BufNewFile,BufRead *.html  setfiletype html
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
set copyindent
set showmatch
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
let NERDTreeWinSize = 15

"Turn off top/bottom bars

set clipboard=unnamed
set tabstop=2
set shiftwidth=2
set shiftround
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
set history=1000
set undolevels=1000
set hidden
set title
set noerrorbells
set nobackup
set noswapfile

"Moving between on-screen lines within a long, wrapped line
nnoremap j gj
nnoremap k gk

"For snipmate:
:filetype plugin on

"Disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['ruby', 'javascript', 'html', 'css'],
                           \ 'passive_filetypes': ['java'] }
"improve redrawing
set ttyfast

"Get rid of bottom status line
set laststatus=0
set noshowmode

"RainbowParentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "!bundle exec rspec {spec}"
let g:rspec_runner = "os_x_iterm"

"Ctrlp search
set wildignore+=*/tmp/*,*.so,*.swp,*.swo,*/vendor/bundle/*,*.zip     " Linux/MacOSX

"NERDTree Toggle
nnoremap <C-e> :NERDTreeToggle<CR>

"Toggle between relative and absolute line numbers
function! RelativeToggle()
  if(&number == 1)
    set nu!
  else
    set number
  endif
endfunc

nnoremap <C-l> :call RelativeToggle()<CR>

"Highlight current row/column
:hi CursorLine   cterm=NONE ctermbg=black guibg=black
:hi CursorColumn cterm=NONE ctermbg=black guibg=black
:set cursorline! cursorcolumn!

"Ctags
set tags=./tags;
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
