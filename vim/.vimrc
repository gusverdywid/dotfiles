"-------------------------------------------------------------------------------
" Vundle
"------------------------------------------------------------------------------
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Easy commenting
Plugin 'scrooloose/nerdcommenter'
" Wrap selection with brackets, quotes, xml tags and many more
Plugin 'tpope/vim-surround'
" Auto completion of quotes, brackets, etc.
Plugin 'raimondi/delimitMate'
" Plugin 'jiangmiao/auto-pairs'
" Code autocompletion
" Plugin 'valloric/youcompleteme'
" Lining up (align) code
Plugin 'godlygeek/tabular'
" HTML expander
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Easily jump / move
Plugin 'easymotion/vim-easymotion'
" Easily jump between tags (% match more)
Plugin 'vim-scripts/matchit.zip'
" Toggle between relative and absolute line numbering
Plugin 'myusuf3/numbers.vim'
" Rails power tools
Plugin 'tpope/vim-rails'
" Buffer explorer
" Plugin 'jlanzarotta/bufexplorer'
" Visual undo tree
Plugin 'mbbill/undotree'
" Content searching (replace ack with silver_searcher)
Plugin 'rking/ag.vim'
" Syntax checking
Plugin 'scrooloose/syntastic'
" Show opened-buffers as a tabline
" Plugin 'bling/vim-bufferline'
" Status bar
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
" Color scheme
Plugin 'altercation/vim-colors-solarized'
" Git indicator on the 'gutter' (line numbers)
Plugin 'airblade/vim-gitgutter'
" File finder
Plugin 'kien/ctrlp.vim'
" Source code browser
Plugin 'majutsushi/tagbar'
" Filesystem explorer
Plugin 'scrooloose/nerdtree'
" Git indicator on nerdtree (file explorer)
Plugin 'xuyuanp/nerdtree-git-plugin'
" Nerdtree on all tabs
" Plugin 'jistr/vim-nerdtree-tabs'
" Git utils
Plugin 'tpope/vim-fugitive'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"


"------------------------------------------------------------------------------
" Customisation
"------------------------------------------------------------------------------

syntax on
" Use the Solarized Dark theme
set background=dark
colorscheme solarized
" colorscheme hybrid_material
" let g:enable_bold_font=1
let g:solarized_termtrans=1
let g:solarized_termcolors=256

set hidden

set autoindent

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Optimize for fast terminal connections
set ttyfast
" Add the g flag to search/replace by default
set gdefault
" Use UTF-8 without BOM
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
" Paste text from external program as-is
" Causing delimitmate (and any auto-closing plugin) to stop working
" set paste
set pastetoggle=<F10>
" Centralize backups, swapfiles and undo history
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
  set undodir=~/.vim/undo
endif

" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Highlight current line
set cursorline
" Space instead of tab
set expandtab
" Number of space each tab
set shiftwidth=2
" Make tabs as wide as two spaces
set tabstop=2
" Show “invisible” characters
set lcs=tab:▸\ ,trail:·,eol:¬,nbsp:_
set list
" Highlight searches
set hlsearch
" Ignore case of searches
set ignorecase smartcase
" Highlight dynamically as pattern is typed
set incsearch
" Enable mouse in all modes
set mouse=a
" Don’t reset cursor to start of line when moving around.
set nostartofline
" Show the cursor position
set ruler
" Show marker
set textwidth=80
set columns=80
" Don’t show the intro message when starting Vim
set shortmess=atI
" Show the current mode
set showmode
" Show the filename in the window titlebar
set title
" Show the (partial) command as it’s being typed
set showcmd
" Start scrolling 10 lines before the horizontal window border
set scrolloff=10

" Different color beyond 80 chars
let &colorcolumn=join(range(81,999),",")

" Use silver searcher
let g:ackprg = 'ag --nogroup --nocolor'
" let g:ackprg = 'ag --vimgrep'


" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown
endif


"------------------------------------------------------------------------------
" Keymaps
"------------------------------------------------------------------------------
" Un-highlight search
nnoremap <esc> :noh<return><esc> 
" Needed to avoid random jump since vim internally uses escape
nnoremap <esc>^[ <esc>^[

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Buffers-related
" Open new buffer
map <leader>n :enew<cr>
" Right buffer (next)
noremap <leader>l :bnext<cr>
" Left buffer (previous)
noremap <leader>h :bprevious<cr>
" Close current buffer
map <leader>w :bp <bar> bd #<cr>

" Indentation
" Shift right
map <leader>] >>
" Shift left
map <leader>[ <<
" Shift right
vmap <leader>] >>
" Shift left
vmap <leader>[ <<


"------------------------------------------------------------------------------
" Nerdcommenter
"------------------------------------------------------------------------------
" Ctrl-/ to comment (no idea why (_) is recognised as (/))
map <leader>/ <plug>NERDCommenterToggle
let NERDSpaceDelims=1


"------------------------------------------------------------------------------
" Powerline
"------------------------------------------------------------------------------

" set laststatus=2
" set guifont=Sauce\ Code\ Powerline:h15
" let g:Powerline_symbols='fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8

" if has("gui_running")
  " let s:uname = system("uname")
  " if s:uname == "Darwin\n"
    " set guifont=Sauce\ Code\ Powerline:h15
  " endif
" endif


"------------------------------------------------------------------------------
" Airline (replacement of Powerline)
"------------------------------------------------------------------------------
" let g:airline_extensions = ['branch'] 

set laststatus=2

" Use powerline's patched fonts1
let g:airline_powerline_fonts=1

" Smarter tab line (automatically display the all buffers when only
" one tab open
let g:airline#extensions#tabline#enabled=1
" Disable tabline
" let g:airline#extensions#tabline#show_tabs=0
" let g:airline#extensions#tabline#show_buffers=0
" let g:airline#extensions#tabline#buffer_min_count=1000
" let g:airline#extensions#tabline#tab_min_count=1000

" Solarized theme
" set background=dark
" let g:airline_theme='solarized'
" let g:airline_theme = "hybrid"

" Bufferline integrations
" let g:airline#extensions#bufferline#enabled=1


"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
" Key mapping
let g:ctrlp_map = '<leader>t'
" Key mapping in ctrl-p prompt
let g:ctrlp_prompt_mappings = {
  \ 'PrtBS()':              ['<bs>'],
  \ 'CreateNewFile()':      ['<c-n>'],
  \ 'AcceptSelection("t")': ['<s-cr>'],
  \ 'AcceptSelection("h")': ['<c-x>'],
  \ 'AcceptSelection("v")': ['<c-\>', '<RightMouse>'],
  \ 'ToggleType(-1)':       ['<c-b>', '<c-h>'],
  \ 'ToggleType(1)':        ['<c-f>', '<c-l>'],
  \ 'PrtCurLeft()':         ['<left>'],
  \ 'PrtCurRight()':        ['<right>'],
  \ 'PrtHistory(-1)':       [],
  \ 'PrtHistory(1)':        []
  \ }
" Starting directory
" 'c' - current dir
" 'r' - nearest ancestor that contains version control dir
" 'a' - like c, but only if current working directory outside CtrlP is not
"       a direct ancestor of the current directory
let g:ctrlp_working_path_mode = 'ra'
" Show hidden files
let g:ctrlp_show_hidden = 1
" Files exclusion
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " MacOSX/Linux
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Custom file listing command
" let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux


"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


let g:syntastic_mode_map = {
  \ "mode": "active",
  \ "active_filetypes": ["ruby", "php", "python", "javascript"],
  \ "passive_filetypes": ["puppet"] }

" HTML5 checker
let g:syntastic_html_tidy_exec = 'tidy5'
" Ruby checker (use rubocop then fallback to mri)
let g:syntastic_ruby_checkers = ["rubocop", "mri"]
" Rubocop path
let g:syntastic_ruby_rubocop_exec = '/usr/local/var/rbenv/shims/rubocop'


"-------------------------------------------------------------------------------
" Ag.vim - the_silver_searcher
"-------------------------------------------------------------------------------
" let g:agprg="<custom-ag-path-goes-here> --vimgrep" " Custom ag path
let g:ag_working_path_mode="r" " start searching from project root


"-------------------------------------------------------------------------------
" Undo tree
"-------------------------------------------------------------------------------
if has("persistent_undo")
  set undodir='~/.vim/undo'
  set undofile
endif


"-------------------------------------------------------------------------------
" Nerdtree
"-------------------------------------------------------------------------------
" Auto start if no file is open
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Key to open nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Close vim if has no window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:NERDTreeIgnore=['.git']



"-------------------------------------------------------------------------------
" Nerdtree tab
"-------------------------------------------------------------------------------
" let g:nerdtree_tabs_open_on_console_startup=1 " Open on startup


"-------------------------------------------------------------------------------
" Easy Motion
"-------------------------------------------------------------------------------
" bi-directional jump
nmap <c-g> <Plug>(easymotion-s)

" 2-characters bi-directional jump
nmap <c-space> <Plug>(easymotion-s2)

" n-character search motion (replaces search)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" hjkl-motions
" Jump forward in current line
map <c-l> <Plug>(easymotion-lineforward)
" Search up
map <c-k> <Plug>(easymotion-k)
" Search down
map <c-j> <Plug>(easymotion-j)
" Jump backward in current line
map <c-h> <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0 " keep cursor column when JK motion

let g:EasyMotion_smartcase = 1 " Smartcase for global search


"------------------------------------------------------------------------------
" DelimitMate
"------------------------------------------------------------------------------
" let loaded_delimitMate = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


"------------------------------------------------------------------------------
" Bufferline
"------------------------------------------------------------------------------
" let g:bufferline_fname_mod = ':t'


"------------------------------------------------------------------------------
" Misc.
"------------------------------------------------------------------------------
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Save session
" fu! SaveSess()
  " execute 'mksession! ' . getcwd() . '/.session.vim'
" endfunction

" fu! RestoreSess()
  " if filereadable(getcwd() . '/.session.vim')
    " execute 'so ' . getcwd() . '/.session.vim'
    " if bufexists(1)
      " for l in range(1, bufnr('$'))
        " if bufwinnr(l) == -1
          " exec 'sbuffer ' . l
        " endif
      " endfor
    " endif
  " endif
  " syntax on
" endfunction

" autocmd VimLeave * call SaveSess()
" autocmd VimEnter * call RestoreSess()
