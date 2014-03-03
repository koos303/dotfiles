execute pathogen#infect()

set rtp+=$HOME/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

if has("gui_macvim") && has("gui_running")
  colorscheme solarized
  set background=dark
  set antialias                      " Pretty
  set guioptions=Ace                 " No menubar, toolbar or scrollbars, as minimal as possible
  set guifont=Dejavu\ Sans\ Mono\ for\ Powerline:h17 " Get Dejavu Sans mono here: http://dejavu-fonts.org/
  set fuoptions=maxvert,maxhorz      " Fixes Full Screen on OSX
  " If you are on OSX Lion, and you hate Lion's native full screen, turn it off for macvim:
  "   defaults write org.vim.MacVim MMNativeFullScreen 0
  " Press Ctrl+Cmd+F to go full screen
else
  colorscheme ir_black
  " Fix terminal timeout when pressing escape
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
end

set encoding=utf-8
set vb t_vb=               " Turn off beep
set number                 " Normal line numbering
set nowrap                 " No wrapping by default
set history=10000          " Keep a lot of stuff in history
set backup                 " Make backups
set backupdir=~/.vim/tmp/  " Keep backups in a central location
set directory=~/.vim/swap/ " Keep swap files in a central location

" Persistent undo
if version >= 703
try
   " E518: Unknown option: undodir=~/.vim_runtime/undodir
   set undodir=~/.vim_runtime/undodir
   " E518: Unknown option: undofile
   set undofile
catch
endtry
endif

set cindent
set expandtab
set shiftwidth=2
set smartindent
set softtabstop=2
set tabstop=2

set list
set listchars=tab:➙.,trail:·,extends:❱,precedes:❰,nbsp:░

set scrolloff=4            " Keep a few lines above and below current line
set equalalways            " create equally sized splits
set splitbelow splitright  " split placement

" Search
set smartcase
set incsearch

let ruby_no_expensive = 1 " Differentiate between do..end and class..end is slow
let ruby_operators = 1    " Highlight Ruby operators
let ruby_space_errors = 1 " Highlights trailing spaces

let g:Powerline_symbols = 'fancy' " Use fancy symbols in vim-powerline

set nocompatible          " be iMproved

syntax enable

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Rename :W to :w
command! W :w

" Buffer Explorer opens with Ctrl+B
nnoremap <C-B> :BufExplorer<cr>

" Handle trailing whitespace, shamelessly taken from http://vimcasts.org/episodes/tidying-whitespace/
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" Run this method on save
autocmd BufWritePre *.rb,*.coffee,*.yml,*.haml,*.erb,*.php,*.java,*.py,*.js :call <SID>StripTrailingWhitespaces()
