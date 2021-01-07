" Comments in Vimscript start with a `"`.

" If you open this file in Vim, it'll be syntax highlighted for you.

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

" This enables relative line numbering mode. With both number and
" relativenumber enabled, the current line shows the true line number, while
" all other lines (above and below) are numbered relative to the current line.
" This is useful because you can tell, at a glance, what count is needed to
" jump up or down to a particular line, by {count}k to go up or {count}j to go
" down.
set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Map system keyboard to vim's paste buffer.
set clipboard=unnamedplus

" Map leader key to a more reachable option namely space.
let mapleader = " "

" Try to prevent bad habits like using the arrow keys for movement. This is
" not the only possible bad habit. For example, holding down the h/j/k/l keys
" for movement, rather than using more efficient movement commands, is also a
" bad habit. The former is enforceable through a .vimrc, while we don't know
" how to prevent the latter.
" Do this in normal mode...
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"This line is to allow for previewing html in firefox
nnoremap <F5> :silent update<Bar>silent !firefox %:p:s?\(.\{-}/\)\{4}?http://localhost/?<CR>

" Whenever you start editing a file, Vim will try to figure out what kind of
" file this is.  When you edit "main.c", Vim will see the ".c" extension and
" recognize this as a "c" filetype.  When you edit a file that starts with
" "#!/bin/sh", Vim will recognize it as a "sh" filetype.
" The filetype detection is used for syntax highlighting and the other two
" items below.
" See |filetypes|.
" Filetype detection.

filetype plugin on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim file explorer configurations
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim tiling controls
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" resize splits within arrow key
map <right> <C-W>>
map <up>    <C-W>+
map <down>  <C-W>-
map <left>  <C-W><


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4 softtabstop=4

" 1 tab == 2 spaces when file type is html,js, or css
autocmd FileType typescript.tsx,typescript,json,html,javascript,css,scss,tex setlocal shiftwidth=2 tabstop=2 softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

set smartindent
set nu
set nowrap
set smartcase

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Auto File Creation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

Plug 'peterhoeg/vim-qml'
Plug 'edtsft/vim-qrc'
" latex plugin for vim
Plug 'lervag/vimtex'
Plug 'peitalin/vim-jsx-typescript'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'ap/vim-css-color'
Plug 'dylanaraps/wal.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'maxmellon/vim-jsx-pretty'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-eunuch'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => fzf-config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>o <ESC>:FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline-settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='base16_adwaita'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimtex
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:tex_flavor = 'latex'
let g:vimtex_context_pdf_viewer = 'zathura'
let g:vimtex_view_method = 'zathura'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Color
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set colorcolumn=80
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" set colorscheme for compatibility with pywal tool
colorschem wal

" set the color of the right column to 5
hi ColorColumn ctermbg=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => FINDING FILES
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set path+=**
"set wildignore+=**/node_modules/**

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tag Jumping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

command! MakeTags !ctags -R .
command! MakeNodeTags !ctags --exclude=.git --exclude=node_modules --exclude=package.json --exclude=package-lock.json --exclude=tsconfig.json -R .

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Formatting Macro
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F3> :Autoformat<CR>
command! FormatJson %!python -m json.tool

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Change the local/global Directory to Directory of Current file
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command LCDC lcd %:p:h
command CDC cd %:p:h

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Snippets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>html :-1read $HOME/.vim/.skeleton.html


