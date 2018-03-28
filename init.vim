" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
"

let g:python3_host_prog = '/usr/local/bin/python3'
call plug#begin('~/.local/share/nvim/site')

Plug 'ElmCast/elm-vim'
Plug 'jalvesaq/Nvim-R'
Plug 'lifepillar/pgsql.vim'
Plug 'ivalkeen/vim-simpledb'

Plug 'vim-scripts/dbext.vim'


Plug 'parsonsmatt/intero-neovim'
Plug 'ndmitchell/ghcid', { 'rtp': 'plugins/nvim' }
Plug 'owickstrom/neovim-ghci'
" Plug 'neovimhaskell/haskell-vim'
" Plug 'itchyny/vim-haskell-indent'
Plug 'vmchale/pointfree'

Plug 'nightsense/seabird'
Plug 'mhartington/oceanic-next'
Plug 'LnL7/vim-nix'
Plug 'tpope/vim-surround'

Plug 'jremmen/vim-ripgrep'
" Plug 'nbouscal/vim-stylish-haskell'
Plug 'alx741/vim-stylishask'
Plug 'vmchale/hask-replace-vim'
Plug 'glittershark/vim-hare'

Plug 'Rykka/InstantRst'
Plug 'Rykka/riv.vim'

" Plug 'pangloss/vim-javascript'
" Plug 'chemzqm/vim-jsx-improve'
"Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'flowtype/vim-flow', { 'for': 'javascript' }

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'alampros/vim-styled-jsx'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'docunext/closetag.vim'
Plug 'ervandew/supertab'
Plug 'haya14busa/incsearch.vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'mileszs/ack.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'qpkorr/vim-bufkill'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'sheerun/vim-polyglot'
Plug 'statico/vim-inform7'
Plug 'tomasr/molokai'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-pathogen'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'

Plug 'purescript-contrib/purescript-vim'
Plug 'frigoeu/psc-ide-vim'

Plug 'khardix/vim-literate'


Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }

" (Optional) Multi-entry selection UI.
Plug 'Shougo/denite.nvim'

" (Optional) Completion integration with deoplete.
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" (Optional) Completion integration with nvim-completion-manager.
Plug 'roxma/nvim-completion-manager'

" (Optional) Showing function signature and inline doc.
Plug 'Shougo/echodoc.vim'

call plug#end()

syntax on
filetype plugin indent on

if !has("gui_vimr")
  set guifont=Source\ Code\ Pro:h13
endif
if !has("gui_running")
  colorscheme OceanicNextLight
else
  colorscheme greygull
endif
let g:sql_type_default = 'pgsql'
let g:R_assign = 2

if has('nvim')

augroup interoMaps
  au!
  " Maps for intero. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>is :InteroStart<CR>
  au FileType haskell nnoremap <silent> <leader>ik :InteroKill<CR>

  " Open intero/GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR>
  " Open intero/GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>iov :InteroOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>ih :InteroHide<CR>

  " Reloading (pick one)
  " Automatically reload on save
  " au BufWritePost *.hs InteroReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :InteroReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>il :InteroLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>

  " Type-related information
  " Heads up! These next two differ from the rest.
  au FileType haskell map <silent> <leader>t <Plug>InteroGenericType
  au FileType haskell map <silent> <leader>T <Plug>InteroType
  au FileType haskell nnoremap <silent> <leader>it :InteroTypeInsert<CR>

  " Navigation
  au FileType haskell nnoremap <silent> <leader>jd :InteroGoToDef<CR>

  " Managing targets
  " Prompts you to enter targets (no silent):
  au FileType haskell nnoremap <leader>ist :InteroSetTargets<SPACE>
augroup END

let g:intero_start_immediately = 0

augroup ghciMaps
  au!
  " Maps for ghci. Restrict to Haskell buffers so the bindings don't collide.

  " Background process and window management
  au FileType haskell nnoremap <silent> <leader>gs :GhciStart<CR>
  au FileType haskell nnoremap <silent> <leader>gk :GhciKill<CR>

  " Open GHCi split horizontally
  au FileType haskell nnoremap <silent> <leader>go :GhciOpen<CR>
  " Open GHCi split vertically
  au FileType haskell nnoremap <silent> <leader>gov :GhciOpen<CR><C-W>H
  au FileType haskell nnoremap <silent> <leader>gh :GhciHide<CR>

  " RELOADING (PICK ONE):

  " Automatically reload on save
  " au BufWritePost *.hs GhciReload
  " Manually save and reload
  au FileType haskell nnoremap <silent> <leader>wr :w \| :GhciReload<CR>

  " Load individual modules
  au FileType haskell nnoremap <silent> <leader>gl :GhciLoadCurrentModule<CR>
  au FileType haskell nnoremap <silent> <leader>gf :GhciLoadCurrentFile<CR>
augroup END

let g:ghci_command = 'stack ghci'
" let g:ghci_command_line_options = '--ghci-options fobject-code'
let g:ghci_start_immediately = 0

endif


" CtrlP
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" JS/JSX
let g:jsx_ext_required = 0
let g:javascript_plugin_flow = 1

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_math = 1

set autoread
set noignorecase
set nostartofline

let g:flow#autoclose = 1



" statico/dotfiles

" ----------------------------------------------------------------------------
" KEY MAPS
" ----------------------------------------------------------------------------

" Useful macros I use the most
nmap \A :set formatoptions+=a<CR>:echo "autowrap enabled"<CR>
nmap \M :set noexpandtab tabstop=8 softtabstop=4 shiftwidth=4<CR>
nmap \T :set expandtab tabstop=8 shiftwidth=8 softtabstop=4<CR>
nmap \a :set formatoptions-=a<CR>:echo "autowrap disabled"<CR>
nmap \b :set nocin tw=80<CR>:set formatoptions+=a<CR>
nmap \c :call TmuxPaneClear()<CR>
nmap \e :NERDTreeToggle<CR>
nmap \f mt:Goyo<CR>'tzz
nmap \g :Gstatus<CR>
nmap \i vip:sort<CR>
nmap \l :setlocal number!<CR>:setlocal number?<CR>
nmap \m :set expandtab tabstop=2 shiftwidth=2 softtabstop=2<CR>
nmap \o :set paste!<CR>:set paste?<CR>
nmap \p :ProseMode<CR>
nmap \q :nohlsearch<CR>
nmap \r :call TmuxPaneRepeat()<CR>
nmap \s :setlocal invspell<CR>
nmap \t :set expandtab tabstop=4 shiftwidth=4 softtabstop=4<CR>
nmap \u :setlocal list!<CR>:setlocal list?<CR>
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
nmap \x :cclose<CR>
nmap \z :w<CR>:!open %<CR><CR>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" You don't know what you're missing if you don't use this.
nmap <C-e> :e#<CR>

" Move between open buffers.
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" Emacs-like bindings in normal mode
nmap <C-x>0 <C-w>c
nmap <C-x>1 <C-w>o
nmap <C-x>1 <C-w>s
nmap <C-x>1 <C-w>v
nmap <C-x>o <C-w><C-w>
nmap <M-o>  <C-w><C-w>

" Emacs-like bindings in insert mode
imap <C-e> <C-o>$
imap <C-a> <C-o>0

" Emacs-like bindings in the command line from `:h emacs-keys`
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Del>
cnoremap <C-e>  <End>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

" Use the space key to toggle folds
nnoremap <space> za
vnoremap <space> zf

" Super fast window movement shortcuts
nmap <C-j> <C-W>j
nmap <C-k> <C-W>k
nmap <C-h> <C-W>h
nmap <C-l> <C-W>l

" Search for the word under the cursor in the current directory
nmap <M-k>    mo:Ack! "\b<cword>\b" <CR>
nmap <Esc>k   mo:Ack! "\b<cword>\b" <CR>
nmap ˚        mo:Ack! "\b<cword>\b" <CR>
nmap <M-S-k>  mo:Ggrep! "\b<cword>\b" <CR>
nmap <Esc>K   mo:Ggrep! "\b<cword>\b" <CR>

" Alt-W to delete a buffer and remove it from the list but keep the window via bufkill.vim
nmap <Esc>w :BD<CR>
nmap ∑      :BD<CR>

" Quickly fix spelling errors choosing the first result
nmap <Leader>z z=1<CR><CR>

" Fix annoyances in the QuickFix window, like scrolling too much
autocmd FileType qf setlocal number nolist scrolloff=0
autocmd Filetype qf wincmd J " Makes sure it's at the bottom of the vim window


" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

" Make the cursor stay on the same line when window switching
function! KeepCurrentLine(motion)
  let theLine = line('.')
  let theCol = col('.')
  exec 'wincmd ' . a:motion
  if &diff
    call cursor(theLine, theCol)
  endif
endfunction
nnoremap <C-w>h :silent call KeepCurrentLine('h')<CR>
nnoremap <C-w>l :silent call KeepCurrentLine('l')<CR>



" ----------------------------------------------------------------------------
" OPTIONS
" ----------------------------------------------------------------------------

set autoindent              " Carry over indenting from previous line
set autoread                " Don't bother me hen a file changes
set autowrite               " Write on :next/:prev/^Z
set backspace=indent,eol,start
                            " Allow backspace beyond insertion point
set cindent                 " Automatic program indenting
set cinkeys-=0#             " Comments don't fiddle with indenting
set cino=                   " See :h cinoptions-values
set commentstring=\ \ #%s   " When folds are created, add them to this
set copyindent              " Make autoindent use the same chars as prev line
set directory-=.            " Don't store temp files in cwd
set encoding=utf8           " UTF-8 by default
set expandtab               " No tabs
set fileformats=unix,dos,mac  " Prefer Unix
set fillchars=vert:\ ,stl:\ ,stlnc:\ ,fold:-,diff:┄
                            " Unicode chars for diffs/folds, and rely on
                            " Colors for window borders
silent! set foldmethod=marker " Use braces by default
set formatoptions=tcqn1     " t - autowrap normal text
                            " c - autowrap comments
                            " q - gq formats comments
                            " n - autowrap lists
                            " 1 - break _before_ single-letter words
                            " 2 - use indenting from 2nd line of para
set hidden                  " Don't prompt to save hidden windows until exit
set history=200             " How many lines of history to save
set hlsearch                " Hilight searching
set ignorecase              " Case insensitive
set incsearch               " Search as you type
set infercase               " Completion recognizes capitalization
set laststatus=2            " Always show the status bar
set linebreak               " Break long lines by word, not char
set list                    " Show whitespace as special chars - see listchars
set listchars=tab:»\ ,extends:›,precedes:‹,nbsp:·,trail:· " Unicode characters for various things
set matchtime=2             " Tenths of second to hilight matching paren
set modelines=5             " How many lines of head & tail to look for ml's
silent! set mouse=nvc       " Use the mouse, but not in insert mode
set nobackup                " No backups left after done editing
set nonumber                " No line numbers to start
set visualbell t_vb=        " No flashing or beeping at all
set nowritebackup           " No backups made while editing
set printoptions=paper:letter " US paper
set ruler                   " Show row/col and percentage
set scroll=4                " Number of lines to scroll with ^U/^D
set scrolloff=15            " Keep cursor away from this many chars top/bot
set sessionoptions-=options " Don't save runtimepath in Vim session (see tpope/vim-pathogen docs)
set shiftround              " Shift to certain columns, not just n spaces
set shiftwidth=2            " Number of spaces to shift for autoindent or >,<
set shortmess+=A            " Don't bother me when a swapfile exists
set showbreak=              " Show for lines that have been wrapped, like Emacs
set showmatch               " Hilight matching braces/parens/etc.
set sidescrolloff=3         " Keep cursor away from this many chars left/right
set smartcase               " Lets you search for ALL CAPS
set softtabstop=2           " Spaces 'feel' like tabs
set suffixes+=.pyc          " Ignore these files when tab-completing
set tabstop=2               " The One True Tab
set textwidth=100           " 100 is the new 80
set thesaurus+=~/.vim/mthes10/mthesaur.txt
set notitle                 " Don't set the title of the Vim window
set wildmenu                " Show possible completions on command line
set wildmode=list:longest,full " List all options and complete
set wildignore=*.class,*.o,*~,*.pyc,.git,node_modules  " Ignore certain files in tab-completion

" Essential for filetype plugins.
filetype plugin indent on

" ----------------------------------------------------------------------------
" CUSTOM COMMANDS AND FUNCTIONS
" ----------------------------------------------------------------------------

" I always hit ":W" instead of ":w" because I linger on the shift key...
command! Q q
command! W w

" Trim spaces at EOL and retab. I run `:CLEAN` a lot to clean up files.
command! TEOL %s/\s\+$//
command! CLEAN retab | TEOL

" Close all buffers except this one
command! BufCloseOthers %bd|e#


" For any plugins that use this, make their keymappings use comma
let mapleader = ","
let maplocalleader = ","

" FZF (replaces Ctrl-P, FuzzyFinder and Command-T)
set rtp+=/usr/local/opt/fzf
set rtp+=~/.fzf
nmap ; :Buffers<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>f :GFiles<CR>
nmap <Leader>a :Ag<CR>

" Tell ack.vim to use ag (the Silver Searcher) instead
let g:ackprg = 'ag --vimgrep'

" GitGutter styling to use · instead of +/-
let g:gitgutter_sign_added = '∙'
let g:gitgutter_sign_modified = '∙'
let g:gitgutter_sign_removed = '∙'
let g:gitgutter_sign_modified_removed = '∙'

" SuperTab
let g:SuperTabLongestEnhanced=1
let g:SuperTabLongestHighlight=1

" Use incsearch.vim to highlight as I search
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap ,<CR> :noh<CR>

" Highlight YAML frontmatter in Markdown files
let g:vim_markdown_frontmatter = 1

" ALE
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title

let g:ale_linters = {
\    'haskell': ['hdevtools', 'hlint', 'hfmt'],
\    'javascript': ['eslint']
\  }

" Lightline
let g:lightline = {
\ 'colorscheme': 'wombat',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }
function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction
function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction
function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update and show lightline but only if it's visible (e.g., not in Goyo)
autocmd User ALELint call s:MaybeUpdateLightline()
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" Custom mode for distraction-free editing
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
  if !has('gui_running')
    let g:solarized_termcolors=256
  endif
  colorscheme greygull
endfunction
command! ProseMode call ProseMode()


" ALE
nmap [r <Plug>(ale_previous_wrap)
nmap ]r <Plug>(ale_next_wrap)

" polyglot disables
let g:polyglot_disabled = ['elm']


autocmd BufRead,BufNewFile *.lhs set filetype=mkdhaskell

autocmd FileType html setlocal formatprg=stylish-haskell

" let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
" let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
" let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
" let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
" let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
" let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
" let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

" tnoremap <Esc> <C-\><C-n>
" au BufNewFile,BufRead *.hs nmap pf <Plug>Pointfree

autocmd BufWinEnter,WinEnter term://* startinsert
autocmd BufLeave term://* stopinsert
tnoremap <C-h> <C-\><C-n><C-w>h
" Workaround since <C-h> isn't working in neovim right now
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l


let g:LanguageClient_serverCommands = {
    \ 'haskell': ['hie', '--lsp'],
    \ }
let R_assign = 0

let g:elm_format_autosave = 0

