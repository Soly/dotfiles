" misc
set nocompatible
set noshowmode
filetype plugin on
filetype indent on

syntax on

set timeout
set timeoutlen=250
set ttimeout
set ttimeoutlen=0

set autoread
set nobackup
set noswapfile
set nu

set incsearch
set showmatch

set expandtab
set shiftwidth=4
set tabstop=4

set noerrorbells
set visualbell
set t_vb=

" remaps
inoremap fd <ESC>
vnoremap fd <ESC>

noremap J <pagedown>
noremap K <pageup>
noremap H <home>
noremap L <end>

" leader
let mapleader = "\<SPACE>"
let g:mapleader = "\<SPACE>"

nmap <leader>w :w!<cr>
nmap <leader>q :q<cr>
nmap <leader>qq :q!<cr>:quit<cr>
nmap <leader>wq :wq!<cr>

nmap <leader>tn :tabnext<cr>
nmap <leader>tp :tabprev<cr>
nmap <leader>to :tabnew<cr>
nmap <leader>tc :tabclose<cr>

nmap <leader>bn :bn<cr>
nmap <leader>bp :bp<cr>
nmap <leader>e :enew<cr>
nmap <leader>bd :bd<cr>

nmap <leader>j <C-w>j
nmap <leader>k <C-w>k
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l

" pathogen
execute pathogen#infect()

" NERDtree
map <leader><leader> :NERDTreeToggle<cr>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeQuitOnOpen=1

" gundo
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_right=1

" dwm
let g:dwm_map_keys=0
nnoremap <silent><leader>o :call DWM_New()<cr>
nnoremap <silent><leader>g :call DWM_Focus()<cr>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme="murmur"

" syntastic
let g:syntastic_python_flake8_args='--ignore=E501'
