set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'Valloric/YouCompleteMe'

Plugin 'scrooloose/nerdtree.git'

Plugin 'junegunn/fzf'

Plugin 'junegunn/fzf.vim'

"Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'NLKNguyen/papercolor-theme'

Plugin 'octol/vim-cpp-enhanced-highlight'

Plugin 'rust-lang/rust.vim'

Plugin 'vimwiki/vimwiki'

Plugin 'dense-analysis/ale'

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
set background=dark
if &term =~# '^screen'
   let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
   let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
colorscheme PaperColor
"colorscheme deep-space
"colorscheme solarized
"let g:deepspace_italics=1

"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"set runtimepath+=~/.vim/bundle/YouCompleteMe
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_enable_diagnostic_signs = 0
let g:ycm_enable_diagnostic_highlighting = 0
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>

" If not set then the syntax highlighting is disabled when returning from
" CTRL+O
set hidden

" Parenthesis matching highlight settings
hi MatchParen guibg=NONE guifg=green

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

" vim-cpp-enhanced-highlight plugin settings 
let g:cpp_member_variable_highlight = 1

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap () ()<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

" size of a hard tabstop
set tabstop=2
" always uses spaces instead of tab characters
set expandtab
" size of an indent
set shiftwidth=2

command! Bd bp|bd#

map <F5> :!cscope -f.cscope.out -Rbqk<CR>:cs add .cscope.out<CR><CR>
map <F6> :!ctags -R -f .tags<CR>

" fuzzy search in file
nnoremap / /
nnoremap // :BLines<CR>

" fuzzy search with fzf
nnoremap <C-p> :FZF<CR>

" fold on indent
set foldmethod=indent

" ycm settings
let g:ycm_autoclose_preview_window_after_completion = 1

" run rustfmt after every save
let g:rustfmt_autosave = 1

set spellfile=$HOME/.vim/spell/en.utf-8.add

" ALE linter config
let g:ale_python_autopep8_options = '--aggressive --aggressive'
let g:ale_python_pylint_options = '--load-plugins pylint_django'

let g:ale_linters = {
      \ 'python': ['pylint', 'autopep8'],
      \ }
let g:ale_fixers = {'python': ['autopep8']}
let g:ale_fix_on_save = 1
