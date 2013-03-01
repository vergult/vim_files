set nocompatible               " be iMproved

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

silent! runtime bundles.vim

"  ---------------------------------------------------------------------------
"  General
"  ---------------------------------------------------------------------------

filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
syntax enable
set autoread

"  ---------------------------------------------------------------------------
"  Clipboard
"  ---------------------------------------------------------------------------
set clipboard=unnamed   " Make it work better with tmux

"  ---------------------------------------------------------------------------
"  UI
"  ---------------------------------------------------------------------------

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile

" Auto adjust window sizes when they become current
set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

" Define autocmd for some highlighting *before* the colorscheme is loaded
if !exists("autocmd_colorscheme_loaded")
  let autocmd_colorscheme_loaded = 1
  autocmd ColorScheme * highlight GoodNews     ctermbg=black     guibg=#002b37 ctermfg=LightGreen   guifg=#12C934
  autocmd ColorScheme * highlight WarningPurp  ctermbg=darkblue guibg=#002b37 ctermfg=White guifg=#B543B3
endif

set background=dark
set t_Co=256
colorscheme molokai

set splitbelow splitright

"  ---------------------------------------------------------------------------
"  Hightlight labels
"  ---------------------------------------------------------------------------

" NOTE: This has to come after we set our colorscheme
" http://davidtuite.com/blog/define-custom-vim-tags-and-labels/
if has("autocmd")
  " Highlight TODO, FIXME, NOTE, etc.
  if v:version > 701
    " Build-in colours: Todo, Debug (not-comprehensive!)
    autocmd Syntax * call matchadd('WarningPurp',  '\W\zs\(???\|NOTE\|TODO\|FIXME\|XXX\)')
    autocmd Syntax * call matchadd('GoodNews', '\W\zs\(INFO\|IDEA\)')
  endif
endif

"  ---------------------------------------------------------------------------
"  Text Formatting
"  ---------------------------------------------------------------------------

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set nowrap
set textwidth=79
set formatoptions=n

" check to make sure vim has been compiled with colorcolumn support
" before enabling it
if exists("+colorcolumn")
  set colorcolumn=80
endif

"  ---------------------------------------------------------------------------
"  Status Line
"  ---------------------------------------------------------------------------

if has('statusline')
  set laststatus=2

  set statusline=%<%f\                      " Filename
  set statusline+=%w%h%m%r                  " Options
  set statusline+=%{fugitive#statusline()}  " Git Hotness
  set statusline+=\ [%{&ff}/%Y]             " filetype
  set statusline+=\ [%{getcwd()}]           " current dir
  set statusline+=%=%-14.(%l,%c%V%)\ %p%%   " Right aligned file nav info
endif

"  ---------------------------------------------------------------------------
"  Mappings
"  ---------------------------------------------------------------------------

" Searching / moving
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch
set showmatch
set hlsearch
" turn search highlight off
nnoremap <leader><space> :noh<cr>
" search (forwards)
nmap <space> /
" search (backwards)
map <c-space> ?

" Center screen when scrolling search results
nmap n nzz
nmap N Nzz

imap <C-h> <ESC>^
imap <C-l> <ESC>$

" Turn off arrow keys (this might not be a good idea for beginners, but it is
" the best way to ween yourself of arrow keys on to hjkl)
" http://yehudakatz.com/2010/07/29/everyone-who-tried-to-convince-me-to-use-vim-was-wrong/
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>"
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

" Map ESC
imap jj <ESC>

" ACK
set grepprg=ack

" ,a to Ack (search in files)
nnoremap <leader>a :Ack

" Ack settings: https://github.com/krisleech/vimfiles/wiki/Make-ack-ignore-files

" Auto format
map === mmgg=G`m^zz

" Move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Switch between buffers
noremap <tab> :bn<CR>
noremap <S-tab> :bp<CR>
" close buffer
nmap <leader>d :bd<CR>
" close all buffers
nmap <leader>D :bufdo bd<CR>

" Switch between last two buffers
nnoremap <leader><leader> <c-^>

" Edit/View files relative to current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

" Ignore some binary, versioning and backup files when auto-completing
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=.svn,CVS,.git,.bzr
set wildignore+=*.gem
set wildignore+=log/*
set wildignore+=tmp/*
set wildignore+=coverage/*
set wildignore+=*.swp
set wildignore+=*.bak
set wildignore+=*.pdf
set wildignore+=*.png,*.jpg,*.gif

" Set a lower priority for .old files
set suffixes+=.old

" Saving and exit
nmap <leader>q :wqa!<CR>
nmap <leader>w :w!<CR>
nmap <leader><Esc> :q!<CR>

" EXTERNAL COPY / PASTE
" Press F2 before and after pasting from an external Window, not required for
" MacVim
set pastetoggle=<F2>
" See here, conflicts with Command Visual
" map <C-v> "+gP<CR>
vmap <C-c> "+y

"  ---------------------------------------------------------------------------
"  Function Keys
"  ---------------------------------------------------------------------------

" F3 - YankRing
nnoremap <silent> <F3> :YRShow<cr>
inoremap <silent> <F3> <ESC>:YRShow<cr>

" Press F5 to toggle GUndo tree
nnoremap <F5> :GundoToggle<CR>

" indent file and return cursor and center cursor
map   <silent> <F6> mmgg=G`m^zz
imap  <silent> <F6> <Esc> mmgg=G`m^zz

"  ---------------------------------------------------------------------------
"  Plugins
"  ---------------------------------------------------------------------------

"  -------------
"  Ctrlp
"  -------------

" Disable default ctrlp mapping
let g:ctrlp_map = '<leader>s'
let g:ctrlp_working_path_mode = 'rc'
let g:ctrlp_max_height = 20
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
" Buffer window (find file in open buffers)
nmap <silent> <leader>b :CtrlPBuffer<CR>
" Search in current's file directory
map <leader>sd :CtrlP %%<cr>

"  -------------
"  NERDTree
"  -------------

let NERDTreeShowBookmarks = 0
let NERDChristmasTree = 1
let NERDTreeWinPos = "left"
let NERDTreeHijackNetrw = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeWinSize = 50
let NERDTreeChDirMode = 2
let NERDTreeDirArrows = 1
" open file browser
map <leader>p :NERDTreeToggle<cr>

"  -------------
"  TagList
"  -------------

set tags=./tags;
" Support for https://github.com/ivalkeen/guard-ctags-bundler
set tags+=gems.tags
map <leader>l :TlistToggle <cr>
let Tlist_Use_Right_Window = 1
let Tlist_WinWidth = 60

" Go to source of function under the cursor
map <silent><leader>j <C-]>
" Go back to where you were
map <silent><leader>jj <C-T>
" Generate ctags for all bundled gems as well
map <leader>rt :!ctags --extra=+f --exclude=.git --exclude=.bzr --exclude=log -R * `rvm gemdir`/gems/* `rvm gemdir`/bundler/gems/*<CR><C-M>

" Use only current file to autocomplete from tags
" set complete=.,t
set complete=.,w,b,u,t,i

"  -------------
"  AutoClose
"  -------------

let g:AutoClosePairs = {'(': ')', '{': '}', '[': ']', '"': '"', "'": "'", '#{': '}'}
let g:AutoCloseProtectedRegions = ["Character"]

let my_home = expand("$HOME/")

"  -------------
"  Tabularize
"  -------------

if exists(":Tab")
  nmap <Leader>t= :Tabularize /=<CR>
  vmap <Leader>t= :Tabularize /=<CR>
  nmap <Leader>t: :Tabularize /:\zs<CR>
  vmap <Leader>t: :Tabularize /:\zs<CR>
  nmap <Leader>t, :Tabularize /,\zs<CR>
  vmap <Leader>t, :Tabularize /,\zs<CR>
  nmap <Leader>t> :Tabularize /=>\zs<CR>
  vmap <Leader>t> :Tabularize /=>\zs<CR>
  nmap <Leader>t- :Tabularize /-<CR>
  vmap <Leader>t- :Tabularize /-<CR>
  nmap <Leader>t" :Tabularize /"<CR>
  vmap <Leader>t" :Tabularize /"<CR>
endif

let g:cssColorVimDoNotMessMyUpdatetime = 1

"  -------------
"  TComment
"  -------------

nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

"  -------------
"  SuperTab
"  -------------

let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

"  -------------
"  Git Blame
"  -------------

vmap <Leader>gb :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p<CR>

"  -------------
"  Fugitive
"  -------------

nmap <Leader>gc :Gcommit -v<CR>
nmap <Leader>gw :Gwrite<CR>
nmap <Leader>gs :Gstatus<CR>
nmap <Leader>gp :Git push<CR>
" Mnemonic, gu = Git Update
nmap <Leader>gu :Git pull<CR>
nmap <Leader>gd :Gdiff<CR>

"  ---------------------------------------------------------------------------
"  Global
"  ---------------------------------------------------------------------------

" Delete trailing whitespaces on file save
autocmd BufWritePre * :%s/\s\+$//e

"  ---------------------------------------------------------------------------
"  Ruby/Rails
"  ---------------------------------------------------------------------------

" Execute current buffer as ruby
" map <S-r> :w !ruby<CR>

map <leader>sv :CtrlP app/views<cr>
map <leader>sc :CtrlP app/controllers<cr>
map <leader>sm :CtrlP app/models<cr>
map <leader>sl :CtrlP app/lib<cr>
map <leader>sh :CtrlP app/helpers<cr>
map <leader>sj :CtrlP app/assets/javascripts<cr>
map <leader>ss :CtrlP app/assets/stylesheets<cr>
map <leader>st :CtrlP test<cr>

" View routes or Gemfile in large split
map <leader>or :topleft :split config/routes.rb<cr>
map <leader>og :topleft 100 :split Gemfile<cr>

" Skip to Model, View or Controller
map <Leader>m :Rmodel
map <Leader>v :Rview
map <Leader>c :Rcontroller

" Other files to consider Ruby
au BufRead,BufNewFile Gemfile,Rakefile,Thorfile,config.ru,Vagrantfile,Guardfile,Capfile set ft=ruby

"  ---------------------------------------------------------------------------
"  SASS / SCSS
"  ---------------------------------------------------------------------------

au BufNewFile,BufReadPost *.scss setl foldmethod=indent
au BufNewFile,BufReadPost *.sass setl foldmethod=indent
au BufRead,BufNewFile *.scss set filetype=scss

"  ---------------------------------------------------------------------------
"  GUI
"  ---------------------------------------------------------------------------

if has("gui_running")
  set guioptions-=T " no toolbar set guioptions-=m " no menus
  set guioptions-=r " no scrollbar on the right
  set guioptions-=R " no scrollbar on the right
  set guioptions-=l " no scrollbar on the left
  set guioptions-=b " no scrollbar on the bottom
  set guioptions=aiA
  set mouse=v
  set guifont=Monaco:h12 "<- Maybe a good idea when using mac
endif
set guifont=Monaco:h12

"  ---------------------------------------------------------------------------
"  Directories
"  ---------------------------------------------------------------------------

set backupdir=~/tmp,/tmp
set undodir=~/.vim/.tmp,~/tmp,~/.tmp,/tmp

" Ctags path (brew install ctags)
let Tlist_Ctags_Cmd = 'ctags'

" Make Vim use RVM correctly when using Zsh
" https://rvm.beginrescueend.com/integration/vim/
set shell=/bin/sh

" Finally, load custom configs
if filereadable(my_home . '.vimrc.local')
  source ~/.vimrc.local
endif

"  ---------------------------------------------------------------------------
"  Misc
"  ---------------------------------------------------------------------------

" When vimrc, either directly or via symlink, is edited, automatically reload it
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %
