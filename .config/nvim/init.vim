let uname = system('uname -s')
if  uname == 'FreeBSD'
  let g:python3_host_prog = '/usr/local/bin/python3.6'
endif
call plug#begin('~/.local/share/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'diepm/vim-rest-console'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'ervandew/supertab'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'shougo/neosnippet.vim'
Plug 'shougo/neosnippet-snippets'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'mhinz/vim-signify'
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'raichoo/smt-vim'
Plug 'pbrisbin/vim-syntax-shakespeare'
Plug 'neovimhaskell/haskell-vim'
Plug 'dag/vim-fish'
Plug 'vim-airline/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'autozimu/LanguageClient-neovim', {
      \ 'branch': 'next',
      \ 'do': 'bash install.sh',
      \ }
Plug 'junegunn/fzf'
Plug 'neomutt/neomutt.vim'
Plug 'StanAngeloff/php.vim'
Plug 'roxma/LanguageServer-php-neovim',  {'do': 'composer install && composer run-script parse-stubs'}
Plug 'jreybert/vimagit'
Plug 'alx741/vim-stylishask'
Plug 'szw/vim-tags'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
call plug#end()

function! Rename(file) abort
  let l:f = expand('%')
  execute 'saveas ' . shellquote(a:file) . ' | ' . 'bd! # | !rm ' . shellquote(l:f)
endfunction
command! -complete=file -nargs=1 Rename call Rename(<f-args>)

function! FixWhitespaces() abort
  let l:search = @/
  let l:l = line('.')
  let l:c = col('.')

  %s/\s\+$//e

  let @/ = l:search
  call cursor(l:l, l:c)
endfunction
command! FixWhitespaces call FixWhitespaces()

" Color Theme
set termguicolors
let g:nord_uniform_status_lines = 1
let g:nord_comment_brightness = 15
colorscheme nord

"Autocompletion
let g:deoplete#enable_at_startup = 1

set updatetime=100
set exrc
set secure
set autoindent
set expandtab
set list
set relativenumber number
set hlsearch
set incsearch
set backspace=indent,eol,start
set enc=utf-8
set ruler
set hidden
set cursorline
set undofile
set undodir=~/.nvim/tmp/undo/
set backupdir=~/.nvim/tmp/backup/
set directory=~/.nvim/tmp/swap/
set backup
set noswapfile
set wrap
set list
set showcmd
set expandtab
set ruler
set tabstop=2
set shiftwidth=2
set smarttab
set backspace=indent,eol,start

let g:LanguageClient_serverCommands = {
      \ 'haskell': ['hie', '--lsp']
      \}
let mapleader="ö"
tnoremap <Esc><Esc> <C-\><C-n>

cnoremap W w
cnoremap Q q

nnoremap <silent> <C-l> :noh<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
nnoremap <F8> :TagbarToggle<CR>

map <silent> <Leader>ls :Denite buffer<CR>
map <silent> <Leader>lf :Denite file_rec<CR>
nmap <silent> <Leader>T :enew<CR>
nmap <silent> <Leader>l :bnext<CR>
nmap <silent> <Leader>h :bprevious<CR>
nmap <silent> <Leader>bq :bp <BAR> bd #<CR>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag AcK
  cnoreabbrev AG Ack
endif

let g:haskell_enable_quantification = 1
let g:haskell_enable_typeroles = 1
let g:haskell_enable_pattern_synonyms = 1
let g:haskell_indent_case_alternative = 1

let g:hamlet_prevent_invalid_nesting = 0

tnoremap <Esc><Esc> <C-\><C-n>
cnoremap W w
cnoremap Q q

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
