set clipboard=unnamedplus
set laststatus=2
set showcmd
set hidden
set noswapfile
set fenc=utf-8
set wildmenu
syntax on
" hybrid line number
set relativenumber
set nu rnu

set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set hlsearch
set incsearch

inoremap jk <Esc>
" noremap x "_x
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

vnoremap > >gv
vnoremap < <gv

" Plugin
let s:jetpackfile = expand('~/.vim/pack/jetpack/opt/vim-jetpack/plugin/jetpack.vim')
let s:jetpackurl = "https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim"
if !filereadable(s:jetpackfile)
  call system(printf('curl -fsSLo %s --create-dirs %s', s:jetpackfile, s:jetpackurl))
endif

packadd vim-jetpack
call jetpack#begin()
Jetpack 'tani/vim-jetpack', {'opt': 1} "bootstrap
Jetpack 'junegunn/fzf.vim'
Jetpack 'junegunn/fzf', { 'do': {-> fzf#install()} }
call jetpack#end()

for name in jetpack#names()
  if !jetpack#tap(name)
    call jetpack#sync()
    break
  endif
endfor
