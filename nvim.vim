call plug#begin('~/.local/share/nvim/plugged')

" Easy commenting
Plug 'scrooloose/nerdcommenter'
" Wrap selection with brackets, quotes, xml tags and many more
Plug 'tpope/vim-surround'
" Cursor multi selections action
Plug 'terryma/vim-multiple-cursors'
" Auto completion of quotes, brackets, etc.
Plug 'raimondi/delimitMate'
" Plug 'jiangmiao/auto-pairs'
" Code autocompletion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'valloric/youcompleteme', { 'for': ['javascript', 'go', 'rust'] }
" Lining up (align) code
Plug 'godlygeek/tabular'
" HTML expander
Plug 'rstacruz/sparkup', { 'rtp': 'vim/', 'for': 'html' }
" Easily jump / move
Plug 'easymotion/vim-easymotion'
" Easily jump between tags (% match more)
Plug 'vim-scripts/matchit.zip'
" Toggle between relative and absolute line numbering
Plug 'myusuf3/numbers.vim'
" Rails power tools
Plug 'tpope/vim-rails'
" Slim file
Plug 'slim-template/vim-slim'
" RSpec runner
Plug 'thoughtbot/vim-rspec', { 'for': 'ruby' }
" Test runner
Plug 'janko-m/vim-test'
" Support for ruby bundler
Plug 'tpope/vim-bundler'
" Buffer explorer
" Plug 'jlanzarotta/bufexplorer'
" Visual undo tree
Plug 'mbbill/undotree'
" Find content
Plug 'mileszs/ack.vim'
" Syntax checking
" Plug 'scrooloose/syntastic'
" Plug 'w0rp/ale'
" Show opened-buffers as a tabline
" Plug 'bling/vim-bufferline'
" Status bar
" Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'bling/vim-airline'
" Airline theme
Plug 'vim-airline/vim-airline-themes'
" Color scheme
" Plug 'altercation/vim-colors-solarized'
Plug 'iCyMind/NeoSolarized'
" Git indicator on the 'gutter' (line numbers)
Plug 'airblade/vim-gitgutter'
" Toggle and navigate marks
Plug 'kshenoy/vim-signature'
" File finder
Plug 'ctrlpvim/ctrlp.vim'
" Source code browser
Plug 'majutsushi/tagbar'
" Filesystem explorer
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Git indicator on nerdtree (file explorer)
Plug 'xuyuanp/nerdtree-git-plugin'
" Nerdtree on all tabs
" Plug 'jistr/vim-nerdtree-tabs'
" Git utils
Plug 'tpope/vim-fugitive'
" Async build and test dispatcher
Plug 'tpope/vim-dispatch'
" Asynchronously run programs
Plug 'neomake/neomake'
" Vue syntax highlights
Plug 'posva/vim-vue'


" All of your Plugins must be added before the following line
" Initialize plugin system
call plug#end()

" Brief help
" PlugInstall [name ...] [#threads]	Install plugins
" PlugUpdate [name ...] [#threads]	Install or update plugins
" PlugClean[!]				Remove unused directories (bang version will clean without prompt)
" PlugUpgrade				Upgrade vim-plug itself
" PlugStatus				Check the status of plugins
" PlugDiff				Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]		Generate script for restoring the current snapshot of the plugins

"
" Put your non-Plug stuff after this line
"


"------------------------------------------------------------------------------
" Customisation
"------------------------------------------------------------------------------

syntax on
" Use the Solarized Dark theme
set background=dark
" colorscheme solarized
colorscheme NeoSolarized
" colorscheme hybrid_material
" let g:enable_bold_font=1
let g:solarized_termtrans=1
let g:solarized_termcolors=256
" Set truecolor
set termguicolors

" Hide the buffers instead of closing it
set hidden

set autoindent

" Make Vim more useful
set nocompatible
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
" set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
" set esckeys
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
silent execute ('!mkdir -p ' . &backupdir)
set directory=~/.vim/swaps
silent execute ('!mkdir -p ' . &directory)
if exists("&undodir")
  set undodir=~/.vim/undo
  silent execute ('!mkdir -p ' . &undodir)
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
set textwidth=100
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



" Strip trailing whitespace (,ss)
function! StripWhitespace()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  :%s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfunction

fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
  endfun

" Automatic commands
if has("autocmd")
  " Enable file type detection
  filetype on
  " Treat .json files as .js
  autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript
  " Treat .md files as Markdown
  autocmd BufNewFile,BufRead *.md setlocal filetype=markdown

  " Show trailing whitepace and spaces before a tab:
  highlight ExtraWhitespace ctermbg=red guibg=red
  autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
  " Automatically remove trailing whitespace
  autocmd BufWritePre * call StripWhitespace()
  " Don't auto remove whitespace in markdown file
  autocmd FileType markdown let b:noStripWhitespace=1
endif


"------------------------------------------------------------------------------
" Keymaps
"------------------------------------------------------------------------------
" Un-highlight search
nnoremap <esc> :noh<return><esc>
" Needed to avoid random jump since vim internally uses escape
nnoremap <esc>^[ <esc>^[
" Close quickfix window
nnoremap <leader>q :ccl<CR>

noremap <leader>ss :call StripWhitespace()<CR>
" Save a file as root (,W)
noremap <leader>W :w !sudo tee % > /dev/null<CR>

" Buffers-related
" Open new buffer
map <leader>n :enew<cr>
" Right buffer (next)
nnoremap <leader>l :bnext<cr>
" Left buffer (previous)
nnoremap <leader>h :bprevious<cr>
" Close current buffer (and quickfix window)
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

" Copying text
nmap yf :let @" = expand("%")<return>


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

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Disable tabline
" let g:airline#extensions#tabline#show_tabs=0
" let g:airline#extensions#tabline#show_buffers=0
" let g:airline#extensions#tabline#buffer_min_count=1000
" let g:airline#extensions#tabline#tab_min_count=1000

" configure the minimum number of tabs needed to show the tabline
" let g:airline#extensions#tabline#buffer_min_count = 2
" configure whether close button should be shown
let g:airline#extensions#tabline#show_close_button = 1
" configure symbol used to represent close button
let g:airline#extensions#tabline#close_symbol = 'X'
" enable/disable displaying index of the buffer
let g:airline#extensions#tabline#buffer_idx_mode = 1

" Switching buffer through index
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" Tabline buffer index format
let g:airline#extensions#tabline#buffer_idx_format = {
\ '0': '0 ',
\ '1': '1 ',
\ '2': '2 ',
\ '3': '3 ',
\ '4': '4 ',
\ '5': '5 ',
\ '6': '6 ',
\ '7': '7 ',
\ '8': '8 ',
\ '9': '9 '
\}

" Solarized theme
let g:airline_solarized_bg='dark'
let g:airline_theme='solarized'
" let g:airline_theme = "hybrid"

" Bufferline integrations
" let g:airline#extensions#bufferline#enabled=1


"-------------------------------------------------------------------------------
" CtrlP
"-------------------------------------------------------------------------------
let g:ctrlp_cmd = 'CtrlP'
" Key mapping
let g:ctrlp_map = '<leader>p'
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
" Does not work with custom ctrlp_user_command
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Custom file listing command
let g:ctrlp_user_command = 'find %s -type f'  " MacOSX/Linux
"
" The Silver Searcher
if executable('ag')
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --hidden --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif


"-------------------------------------------------------------------------------
" Syntastic
"-------------------------------------------------------------------------------
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

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
" ALE (syntax checking)
"-------------------------------------------------------------------------------
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_fix_on_save = 1
" Error and warning on status line
let g:airline#extensions#ale#enabled = 1
" Use location list instead of quickfix
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
" Only show 5 errors
let g:ale_list_window_size = 5
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['brakeman', 'rubocop', 'ruby']
\}
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\}


"-------------------------------------------------------------------------------
" Ag.vim - the_silver_searcher
"-------------------------------------------------------------------------------
" let g:agprg="<custom-ag-path-goes-here> --vimgrep" " Custom ag path
" let g:ag_working_path_mode="r" " start searching from project root

"-------------------------------------------------------------------------------
" Ack.vim
"-------------------------------------------------------------------------------
cnoreabbrev Ack Ack!
nnoremap <leader><S-F> :Ack!<Space>


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
map <C-\> :NERDTreeToggle<CR>
nnoremap <leader>\ :NERDTreeFind<CR>

let NERDTreeShowHidden=1 " Show hidden files
let NERDTreeQuitOnOpen=1 " Directly close after opening a file
let NERDTreeIgnore=['.git', 'node_modules'] " Ignore git
let NERDTreeHighlightCursorline=1
let NERDTreeHijackNetrw=1 " Use NERDTree instead the default netrw
let NERDTreeMouseMode=2 " Single click for dir, double click for file
" let NERDTreeWinSize = 50 " Window size


" Close vim if has no window left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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
" GitGutter
"------------------------------------------------------------------------------
" Disable key mapping
let g:gitgutter_map_keys = 0

" Display current branch
set statusline+=%{FugitiveStatusline()}
set statusline+=%*

" Override sign (NeoSolarised customises it)
let g:gitgutter_override_sign_column_highlight = 0


"------------------------------------------------------------------------------
" DelimitMate
"------------------------------------------------------------------------------
" let loaded_delimitMate = 1
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1


"------------------------------------------------------------------------------
" RSpec.vim
"------------------------------------------------------------------------------
" let g:rspec_runner = "os_x_iterm2"
" let g:rspec_command = "compile rspec | set makeprg=spring | Make rspec {spec}"

" nnoremap <leader>tf :call RunCurrentSpecFile()<CR>
" nnoremap <leader>tl :call RunNearestSpec()<CR>
" nnoremap <leader>tp :call RunLastSpec()<CR>
" nnoremap <leader>ta :call RunAllSpecs()<CR>


"------------------------------------------------------------------------------
" vim-test
"------------------------------------------------------------------------------
" Don't clear screen before each run
let g:test#preserve_screen = 1

" make test commands execute using dispatch.vim
let test#strategy = "dispatch"

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nnoremap <leader>tf :TestFile<CR>
nnoremap <leader>tl :TestNearest<CR>
nnoremap <leader>tp :TestLast<CR>
nnoremap <leader>ta :TestSuite<CR>


"------------------------------------------------------------------------------
" Neomake
"------------------------------------------------------------------------------
call neomake#configure#automake('w')
let g:neomake_open_list = 2
let g:airline#extensions#neomake#enabled=1

" Ruby settings
let g:neomake_ruby_enabled_makers = ['mri', 'rubocop', 'reek']
let g:neomake_ruby_rubocop_maker = {
\ 'args': ['--format', 'emacs', '--force-exclusion', '--display-cop-names', '--auto-correct'],
\ 'errorformat': '%f:%l:%c: %m',
\ }
" Callback for reloading file in buffer when eslint has finished and maybe has
" autofixed some stuff
function! s:reload_upon_neomake_finished()
  let jobinfo = g:neomake_hook_context.jobinfo
  if (jobinfo.maker.name ==? 'rubocop')
    checktime
  endif
endfunction

augroup auto_reload_neomake
  " Clear any old commands
  au!
  " Reload buffer upon neomake finished executing the job
  autocmd User NeomakeJobFinished call s:reload_upon_neomake_finished()
augroup END


"------------------------------------------------------------------------------
" Rails
"------------------------------------------------------------------------------
nnoremap <leader>rm :Rails db:migrate<CR>


"------------------------------------------------------------------------------
" Bundler
"------------------------------------------------------------------------------
nnoremap <leader>bi :Bundle check <Bar> :Bundle install<CR>


"------------------------------------------------------------------------------
" Bufferline
"------------------------------------------------------------------------------
" let g:bufferline_fname_mod = ':t'


"------------------------------------------------------------------------------
" Deoplete for autocompletion
"------------------------------------------------------------------------------
" Use deoplete.
let g:deoplete#enable_at_startup = 1


"------------------------------------------------------------------------------
" Numbers (relative/absolute line toggle)
"------------------------------------------------------------------------------
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m']


"------------------------------------------------------------------------------
" Misc.
"------------------------------------------------------------------------------
" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  let g:ackprg = 'ag --nogroup --nocolor --vimgrep'
  " let g:ackprg = 'ag --vimgrep'
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

