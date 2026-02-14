" ============================================================================
" EDITOR SETTINGS
" ============================================================================

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2
set tabstop=8
set number
set nowrap
set hlsearch
set smartcase
set incsearch
set ruler
set nojoinspaces
set backspace=indent,eol,start
set mouse=v
set title
set termguicolors
set signcolumn=yes
set updatetime=300
set hidden
set nobackup
set nowritebackup
set cmdheight=2

syntax on

" Comments are light grey and italicized
highlight Comment ctermfg=grey
highlight Comment cterm=italic gui=italic

" ============================================================================
" KEY MAPPINGS & LEADER
" ============================================================================

" Change leader to comma
let mapleader=","

" Debugging loggers - <leader>c inserts console.log/Rails.logger.debug/puts
autocmd FileType coffee map <buffer> <leader>c <Esc>yiwo<Esc>pcawconsole.log<Space>"<Esc>pA,<Space><Esc>p
autocmd FileType javascript map <buffer> <leader>c <Esc>yiwo<Esc>pcawconsole.log("<Esc>p<Esc>ei,<Space><Esc>p
autocmd FileType ruby map <buffer> <leader>c <Esc>yiwoRails.logger.debug<Space>{ "<Esc>p<C-V>i"~$hi:<Space>#{<Esc>pa.inspect<Esc>
autocmd FileType ruby map <buffer> <leader>t <Esc>yiwo<Esc>pvaw~cawputs<Space>"<Esc>pa:<Space>#{<Esc>pvaw~t}a.inspect<Esc>
autocmd FileType typescript map <buffer> <leader>c <Esc>yiwo<Esc>pcawconsole.log("<Esc>p<Esc>ei,<Space><Esc>p
autocmd FileType typescriptreact map <buffer> <leader>c <Esc>yiwo<Esc>pcawconsole.log("<Esc>p<Esc>ei,<Space><Esc>p
autocmd FileType slim map <buffer> <leader>c <Esc>yiwo<Esc>pcawconsole.log("<Esc>p<Esc>ei,<Space><Esc>p

" Disable arrow keys in normal mode (forces hjkl navigation)
nmap <Up> <Nop>
nmap <Right> <Nop>
nmap <Left> <Nop>
nmap <Down> <Nop>

" ============================================================================
" PLUGIN INSTALLATION
" ============================================================================

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
  " Color schemes
  Plug 'drewtempelmeyer/palenight.vim'

  " Rainbow colors for nested parens, brackets, etc
  Plug 'frazrepo/vim-rainbow'

  " Airline setup
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " To replace surrounding delimiters with one command
  Plug 'tpope/vim-surround' " Quotes and braces

  " Helps plugins tap into '.'
  Plug 'tpope/vim-repeat'

  " UNIX commands. Most notaby — :wall
  Plug 'tpope/vim-eunuch' " UNIX commands

  " Allows you to open to file line
  Plug 'bogado/file-line', {'branch': 'main'}

  " Use gS and gJ to split/join statements
  " gS = Split one-liner into multiple lines (e.g., {foo: 1} -> multi-line)
  " gJ = Join multi-line into one-liner
  Plug 'AndrewRadev/splitjoin.vim'

  " Nerdtree is a great file system explorer. :NERDTree to open
  Plug 'preservim/nerdtree'

  " Automatically close surrounding delimiters
  Plug 'Raimondi/delimitMate' " Quotes/Braces

  " Automatically adds 'end' in ruby for def/if/etc
  Plug 'tpope/vim-endwise'

  " Highlight whitespace
  Plug 'ntpeters/vim-better-whitespace'

  " Language support
  Plug 'sheerun/vim-polyglot'
  Plug 'tpope/vim-rails'
  Plug 'tpope/vim-rake'
  Plug 'tpope/vim-bundler'
  Plug 'itmammoth/run-rspec.vim'

  " Comment stuff out with gcc
  Plug 'tpope/vim-commentary' " Line comments

  " GitSupport
  " Shows git diff by symbols in the gutter
  Plug 'airblade/vim-gitgutter'
  " Shows gitblame
  if has('nvim')
    Plug 'APZelos/blamer.nvim'
  endif

  " Intellisense engine for vim8 & neovim
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Support syntax & rubocop checkers
  Plug 'dense-analysis/ale'
  Plug 'ngmy/vim-rubocop'

  " Fuzzy Finder
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

call plug#end()

" ============================================================================
" PLUGIN CONFIGURATION
" ============================================================================

" Color Scheme
colorscheme palenight

" Airline Configuration
let g:airline_symbols={}
let g:airline_symbols.maxlinenr = ''
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#checking_symbol = ''
let g:airline#extensions#ale#open_lnum_symbol = ' :'
let g:airline#extensions#ale#close_lnum_symbol = ''

" Rainbow Parens
" Colored matching for enclosures - set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1

" RSpec Runner
" Mapping for commonly used RSpec Commands (via run-rspec plugin)
nnoremap <leader>r :RunSpec<CR>
nnoremap <leader>l :RunSpecLine<CR>
nnoremap <leader>a :RunSpecLastRun<CR>
nnoremap <leader>cr :RunSpecCloseResult<CR>

" Git Blame (Blamer)
if has('nvim')
  let g:blamer_enabled = 1
  let g:blamer_show_in_visual_modes = 0
  let g:blamer_template = '<committer> • <summary>'
endif

" NERDTree Configuration
let NERDTreeShowLineNumbers=1
map <C-n> :NERDTreeToggle<CR>

" CoC (Conquer of Completion) Configuration
" Autocomplete, go-to-definition, etc.
let g:coc_global_extensions = [
  \"coc-eslint",
  \"coc-json",
  \"coc-tsserver",
  \"coc-html",
  \"coc-css",
  \"coc-yaml",
  \"coc-yank",
  \"coc-prettier"
  \]

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> ga <Plug>(coc-codeaction-cursor)
nmap <silent> gA <Plug>(coc-codeaction-source)
"
" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" ALE (Asynchronous Lint Engine) Configuration
" Linting and auto-fixing
let g:ale_lint_on_save = 0
let g:ale_echo_cursor = 0
let g:ale_virtualtext_cursor = 2
let g:ale_floating_preview = 1
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']
let g:ale_close_preview_on_insert = 1
let g:ale_sign_error = ' '
let g:ale_sign_warning = ' '
let g:ale_sign_info = ' '
let g:ale_virtualtext_prefix = '• %code: %'

let g:ale_fixers = {
\   'css': ['prettier'],
\   'graphql': ['prettier'],
\   'html': ['prettier'],
\   'javascript': ['prettier'],
\   'less': ['prettier'],
\   'markdown': ['prettier'],
\   'scss': ['prettier'],
\   'typescript': ['prettier'],
\   'ruby': ['rubocop'],
\}

nmap <silent> ge <Plug>(ale_detail)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
augroup end

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

highlight link ALEWarningSign Todo
highlight ALEInfoSign ctermfg=4 ctermbg=18 guifg=#FFD700
highlight ALEError term=underline cterm=underline,bold gui=underline,bold
highlight ALEWarning term=underline cterm=undercurl gui=undercurl
highlight ALEInfo term=underline cterm=undercurl gui=undercurl

