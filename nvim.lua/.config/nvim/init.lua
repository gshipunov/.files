-- set leader and locleader before setting any maps
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- set up packer and all the plugins
require('plugins')

-- old config still to luaify
vim.cmd([[
" filetype magic
autocmd BufRead,BufNewFile *.nasm set filetype=nasm

" langmap russian
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" Incrementally show effects of :s, :smagic, :snomagic
set icm=split
"set signcolumn=yes

set number


set nobackup nowritebackup
set noswapfile

" autosmartident
set ai
set si
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" arrows for visual line navigation
imap <up> <C-O>gk
imap <down> <C-O>gj
nmap <up> gk
nmap <down> gj
vmap <up> gk
vmap <down> gj

set history=999
set undolevels=999

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy
" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

"set updatetime=107

" disable modelines
set nomodeline

" change tab completion to more bash-like
set wildmode=longest:full,list:full

" U is quite useless
nnoremap U :echo "NOPE!"<CR>

" help is quite annoying when you miss esc
map <F1> <Esc>
imap <F1> <Esc>

" do not conceal stuff
set conceallevel=0
set foldlevel=999

" Whitespace highlight
highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+\%#\@<!$/

" highlight yanked text
augroup highlight_yank
autocmd!
au TextYankPost * silent! lua vim.highlight.on_yank { higroup='IncSearch', timeout=200 }
augroup END

]])

