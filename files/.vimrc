syntax enable
set number
set relativenumber

set background=dark

set tabstop=2
set softtabstop=2
set shiftwidth=2

set noexpandtab

set encoding=utf8

set ffs=unix,dos,mac

set noerrorbells
set novisualbell

set backspace=eol,start,indent
set ignorecase
set smartcase

set autoindent
set smartindent

set autoread

set cc=81,121,141
hi ColorColumn ctermbg=darkred guibg=darkred

set rtp+=~/.local/lib/python3.8/site-packages/powerline/bindings/vim

set laststatus=2
set t_Co=256

command! Copy :set number! relativenumber!

" python3 from powerline.vim import setup as powerline_setup
" python3 powerline_setup()
" python3 del powerline_setup
