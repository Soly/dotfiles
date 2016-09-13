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
set nu

set incsearch
set showmatch

set expandtab
set shiftwidth=4
set tabstop=4

set noerrorbells
set visualbell
set t_vb=

" backup, swap, undo
if isdirectory($HOME . '/.vim/tmp/backup') == 0
    :silent !mkdir -p ~/.vim/tmp/backup >/dev/null 2>&1
end
set backupdir=~/.vim/tmp/backup//

if isdirectory($HOME . '/.vim/tmp/swap') == 0
    :silent !mkdir -p ~/.vim/tmp/swap >/dev/null 2>&1
endif
set directory=~/.vim/tmp/swap//

if isdirectory($HOME . '/.vim/tmp/undo') == 0
    :silent !mkdir -p ~/.vim/tmp/undo > /dev/null 2>&1
endif
set undodir=~/.vim/tmp/undo//

" Filetype prefs
autocmd Filetype c setlocal ts=2 sts=2 sw=2


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

" NERDcommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" gundo
nnoremap <leader>u :GundoToggle<cr>
let g:gundo_right=1

" dwm
let g:dwm_map_keys=0
let g:dwm_master_pane_width="60%"
nnoremap <silent><leader>o :call DWM_New()<cr>
nnoremap <silent><leader>g :call DWM_Focus()<cr>
nnoremap <silent><C-l> :call DWM_GrowMaster()<cr>
nnoremap <silent><C-h> :call DWM_ShrinkMaster()<cr>

"Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
nnoremap <silent><leader>z :ZoomToggle<CR>

" airline
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme="murmur"

" syntastic
let g:syntastic_python_flake8_args='--ignore=E501'

" ansible
let g:ansible_options = {'ignore_blank_lines': 0}
