set ai
set tabstop=2 shiftwidth=2 expandtab
set belloff=all
set autoindent
set smartindent
set ruler
set splitbelow
syntax on

set background=dark

call plug#begin()
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'preservim/nerdtree'
call plug#end()

set encoding=utf-8
set number relativenumber
set mouse=a

"
"ctrlp
"
let g:ctrlp_custom_ignore='dependencies\|.fsenv\|.pants.d\|.pvenvs\|.wheelhouse'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let g:ctrlp_max_files = 200000

"
"nerdtree
"
" Start NERDTree when Vim starts with a directory argument.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif

"
" tabs
"
nnoremap tn  :tabnew<Space>
nnoremap tc  :tabclose<CR>
nnoremap gl  gt
nnoremap gh  gT
