set nocompatible              " be iMproved, required
filetype off                  " required
set encoding=utf-8

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree.git'

Plugin 'junegunn/fzf'

Plugin 'junegunn/fzf.vim'

"Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'vimwiki/vimwiki'

Plugin 'editorconfig/editorconfig-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
syntax on

" Color scheme
syntax enable
"set background=dark
set t_Co=256
"set background=dark
if &term =~# '^screen'
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors

" Parenthesis matching highlight settings
" commented out because it seems it is not needed with PaperColor color scheme
"hi MatchParen guibg=NONE guifg=green

" Color scheme settings
colorscheme PaperColor
set background=light

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" If not set then the syntax highlighting is disabled when returning from
" CTRL+O
set hidden

" NERDTree accessible from CTRL+e
map <C-e> :NERDTreeToggle<CR>
" Show hidden file
let NERDTreeShowHidden=1

" remap ESC to jj
imap jk <Esc>

set tags+=.tags;$HOME

"remap Rg. Rg is the command for ripgrep which is a replacement for grep
"written in Rust
let g:rg_command = '
  \ rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always"
  \ -g "*.{js,json,php,md,styl,jade,html,config,py,cpp,c,go,hs,rb,conf}"
  \ -g "!{.git,node_modules,vendor}/*" '

command! -bang -nargs=* F call fzf#vim#grep(g:rg_command .shellescape(<q-args>), 1, <bang>0)

"Search as you type 
set incsearch

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" move to the beginning of the non blank character of the line
nnoremap 00 ^

" delete within parentheses
nnoremap din di)

" comment selected lines
xnoremap // 0<C-V>I//<ESC>

" size of a hard tabstop
set tabstop=2
" always uses spaces instead of tab characters
set expandtab
" size of an indent
set shiftwidth=2

command! Bd bp|bd#

" Maximize window
nnoremap <F8> <C-W>_<C-W><Bar>
nnoremap <F7> <C-W>=

" fuzzy search in file
nnoremap / /
nnoremap // :BLines<CR>

" fuzzy search with fzf
nnoremap <C-p> :FZF<CR>

" fold on indent
set foldmethod=indent

" show line number at the bottom right
set ruler

" show file name at the bottom
set laststatus=2

set spellfile=$HOME/.vim/spell/en.utf-8.add

" Vimwiki
let g:vimwiki_folding='list'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
