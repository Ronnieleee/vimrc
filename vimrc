"===============================================================================
"	    Copyright(c) 2016, Lee Long. All rights reserved.
"	    Filename:    vimrc
"	    Version:     1.3
"	    Author:      Ronnie lee
"	    Email:       ronnie.lee@foxmail.com
"	    Date:        
"	    Description: configure file for the vim editor
"       ReadMe:      README.md
"       Sections:
"                   ->General      Basic settings
"                   ->Show         Appearances & types settings
"                   ->Fileencoding Encodings & formats settings
"                   ->Hot keys     Personal Hotkeys settings
"                   ->Colortheme   Themes settings
"                   ->Others       Other settings
"===============================================================================

"===============================================================================
"                   ->General      Basic settings
"===============================================================================
set nocompatible    " Use Vim settings, rather than Vi settings.
set history=2000    " History length.
filetype on         " Enable file type detection.
filetype plugin on  " Enable loading the plugin files for specific file types.
filetype indent on  " Enable loading the indent file for specific file types.
set autoread        " Auto read the file when it has been detected to have been
                    " changed outside of Vim and it has not been changed inside
                    " of Vim.
"set backup         " Make a backup before overwriting a file.
"set backupext=.bak " String which is appended to a file name to make the name
                    " of the backup file.
"set backupdir=~/bak/vimbk/
                    " Directory to store the backup files.
set nobackup        " Cancel the backup.
set noswapfile      " Do not use a swapfile for the buffer.
" Comment the next two lines if the file's textwidth is longer than 80.
"set cursorcolumn    " Highlight the screen column of the cursor with *column.
"set cursorline      " Highlight the screen line of the cursor with CursorLine.
set mouse=a         " Enable the use of the mouse.
"set viminfo^=%     " Remember info about open buffers on close
set selection=inclusive
                    " Including the cursor
set selectmode=mouse,key,cmd
                    " mouse: using the mouse to select areas.
                    " key:   using the shifted special keys.
                    " cmd:   using "v", "V",CTRL-V.
set title           " Set the title of the window to the filename.
" No annoying sound on errors
set novisualbell    " Do't beep.
set noerrorbells    " No error beeping.
set t_vb=           " Visual bell
set t_ti= t_te=     " The texts will be shown in the terminal when quit vim.


"===============================================================================
"                   ->Show         Appearances & types settings
"===============================================================================
set number          " Print the line number in front of each line.
set ruler           " Show the line and colum number of the cursor position.
set nowrap          " When off lines will not wrap and only part of long lines
                    " will be displayed.
set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one
set matchtime=2     " Tenths of seconds to show the matching paren
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
set incsearch       " While typing a search command, show where the pattern, as
                    " it was typed so far, matches.
set magic           " For regular expressions turn magic on
set ignorecase      " The case of normal letters is ignored.
set smartcase       " Ignore case if search pattern is all lowercase,
                    " case-sensitive when search pattern contains upper case
                    " characters.

" Folding methods. Modify it when necessary.
set foldenable      " Enable fold.
set foldmethod=indent
                    " fold method
                    " manual    Folds are created manually.
                    " indent    Lines with equal indent form a fold.
                    " expr      'foldexpr' give the fold level of a line.
                    " syntax    Syntax highlighting items specify folds.
                    " diff      Fold text that is not changed.
                    " marker    Markers are used to specify folds.
set foldlevel=99    " fold level.

set whichwrap+=<,>,h,l
                    " Move 0 previous $ next
set backspace=eol,start,indent
                    " Configure backspace so it acts as it should act
set smartindent     " Do smart autoindenting when starting a new line.
set autoindent      " Copy indent from current line when starting a new line
set tabstop=4       " Number of spaces to use for <Tab>
set shiftwidth=4    " Number of spaces to use for autoindenting
set textwidth=80    " Maximum width of text that is being inserted.
set softtabstop=4   " Number of spaces that a <Tab> counts for while performing
                    " editing operations
set smarttab        " Insert tabs on the start of a line according to
                    " shiftwidth, not tabstop
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
set shiftround      " Use multiple of shiftwidth when indenting with '<' and '>'
set showmode        " Show current mode
set showcmd         " Show command in the last line of the screen.
"set cmdheight=2    " Number of screen lines to use for command-line.
set hidden          " A buffer becomes hidden when it is abandoned
set wildmode=list:longest
                    " Completion mode that is used for the character specified
                    " with 'wildchar'.
set ttyfast         " Indicates a fast terminal connection.
set relativenumber  " Show the line number relative to the line with the cursor
                    " in front of each line.

" Create undo file for the current file.
set undolevels=1000
                    " How many undos.
set undoreload=10000
                    " Number of lines to save for undo.
if v:version >= 730 " keep a persistent backup file.
        set undofile
    set undodir=~/bak/vimundo/
endif

set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*~
                    " A list of file patterns will be ignored.
set scrolloff=7     " Minimal number of screen lines to keep above and below the
                    " cursor.
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
set laststatus=2    " Always show the status line.

"au FocusLost :set number
"au FocusGained :set relativenumber
function! NumberToggle()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc
nmap <F5> :call NumberToggle()<cr>


"===============================================================================
"                   ->Fileencoding Encodings & formats settings
"===============================================================================
set encoding=utf-8  " Sets the character encoding to utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
                    " A list of character encodings considered when starting to
                    " edit an existing file.
set termencoding=utf-8
                    " Encoding used for the terminal.
set fileformats=unix,dos,mac
                    " Use Unix as the standard file type
set formatoptions+=m
                    " Above 255 for Asian text.
set formatoptions+=B
                    " No blank when jion two lines.


"===============================================================================
"                   ->Hot keys     Personal Hotkeys settings
"===============================================================================
" Basic editor hot keys.
nmap <C-s> :w!<CR>
nmap <C-z> u
nmap <C-a> ggVG
imap <C-v> <Esc>"+pa
vmap <C-x> "+d
vmap <C-c> "+y

" <leader> key mapping
let mapleader = ','
let g:mapleader = ','

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

"set paste
set pastetoggle=<F5>            " when in insert mode, press <F2> to go to
"    paste mode, where you can paste mass data
"    that won't be autoindented

" disbale paste mode when leaving insert mode
au InsertLeave * set nopaste

nnoremap <F6> :exec exists('syntax_on') ? 'syn off' : 'syn on'<CR>
                    " Enable syntax.
noremap <silent><leader>/ :nohls<CR>
                    " No highlight search result.
nnoremap ; :
                    " Use ; to replace :

"Use sane regexes"
"nnoremap / /\v
"vnoremap / /\v

map <leader>bd :Bclose<cr>
                    " Close the current buffer
map <leader>ba :1,1000 bd!<cr>
                    " Close all the buffers
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/


"===============================================================================
"                   ->Colortheme   Themes settings
"===============================================================================
syntax enable       " syntax highlighting.
syntax on
set background=dark " set background color to dark.
" Change the themes and background colors.
"colorscheme solarized
                    " themes solarized.
"colorscheme molokai
colorscheme torte
set t_Co=256        " Number of colors

" Set extra options when running in GUI mode
if has("gui_running")
    set guifont=Monaco
    set guioptions-=T
    "set guioptions-=m
    set guioptions-=e
    set guioptions-=r
    set guioptions-=L
    set guitablabel=%M\ %t
    set showtabline=1
    set linespace=2
    set noimd
    set t_Co=256
endif

"设置标记一列的背景颜色和数字一行颜色一致
hi! link SignColumn   LineNr
hi! link ShowMarksHLl DiffAdd
hi! link ShowMarksHLu DiffChange

"" for error highlight，防止错误整行标红导致看不清
highlight clear SpellBad
highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline


"===============================================================================
"                   ->Others       Other settings
"===============================================================================
autocmd! bufwritepost _vimrc source %
                    " auto load vim configuring file .vimrc for windows.
autocmd! bufwritepost .vimrc source %
                    " auto load vim configuring file .vimrc for linux.
set completeopt=longest,menu
                    " Insert mode completion options.
set wildmenu        " Easy for completion.
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
                    " Auto close the preview when left the insert model.
autocmd FileType python set tabstop=4 shiftwidth=4 expandtab ai
                    " Tabstop and shiftwidth length for python file.
" If this not work ,make sure .viminfo is writable for you.
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Delete trailing white space on save, useful for Python and CoffeeScript.
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()

filetype on
