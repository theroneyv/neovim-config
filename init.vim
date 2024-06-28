"
" configuracion general
"

syntax on
set number

set tabstop=4
set shiftwidth=4

set notermguicolors
set background=dark

set smartcase
set ignorecase

" netrw
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3
let g:netrw_keepdir=0

"
" atajos del teclado
"

" guardar archivo
nnoremap <C-s> :w<Enter>
inoremap <C-s> <Esc>:w<Enter>a

" salir del editor
nnoremap <C-q> :q<Enter>
inoremap <C-q> <Esc>

" explorador de archivos
nnoremap <C-l> :NERDTreeToggle<Enter>

" terminal
nnoremap <C-b> :botright terminal<Enter> :resize 13<Enter>a

"
" vim-plug
"
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'sainnhe/sonokai'
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" colorscheme
color sonokai

"
" NERDTree
"
let g:NERDTreeWinSize=25
let g:NERDTreeMinimalUI=1

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif

" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
