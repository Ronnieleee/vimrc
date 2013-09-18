"===============================================================================
"	    Copyright(c) 2013, Lee Long. All rights reserved.
"	    Filename:    vimrc
"	    Version:     1.2
"	    Author:      Lee Long
"	    Email:       lonely.hust@gmail.com
"	    Date:        2013-08-29 16:30:20
"	    Description: configure file for the vim editor
"       ReadMe:      README.md
"       Sections:
"                   ->General      Basic settings
"                   ->Show         Appearances & types settings
"                   ->Fileencoding Encodings & formats settings
"                   ->Hot keys     Personal Hotkeys settings
"                   ->Bundle       Vim Scripts managing & settings
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
set cursorcolumn    " Highlight the screen column of the cursor with *column.
set cursorline      " Highlight the screen line of the cursor with CursorLine.
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
"                   ->Bundle       Vim Scripts managing & settings
"===============================================================================
"       Bundle the plugins
"       Package dependent:  ctags
"       Python dependent:  pep8, pyflake

filetype off        " required! turn off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#rc()

"##################### Vundle #####################"
" Plugin to manage vim scripts.
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
Bundle 'gmarik/vundle'
                    " Let Vundle manage Vundle, required.

"#################### Nerdtree ####################"
" The plugin tree allows you to explore your
" filesystem and to open files and directories.
Bundle 'scrooloose/nerdtree'
map <leader>n :NERDTreeToggle<CR>
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.obj$', '\.o$', '\.so$', '\.egg$', '^\.git$', '^\.svn$', '^\.hg$' ]
let g:netrw_home='~/bak'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end
                    " Close vim if the only window left open is a NERDTree

"###################### A.vim #####################"
" A few of quick commands to swtich between
" source files and header files quickly.
Bundle 'vim-scripts/a.vim'
" :A switches to the header file corresponding to 
" the current file being edited (or vise versa)
" :AS splits and switches
" :AV vertical splits and switches
" :AT new tab and switches
" :AN cycles through matches
" :IH switches to file under cursor
" :IHS splits and switches
" :IHV vertical splits and switches
" :IHT new tab and switches
" :IHN cycles through matches

"############# Minibufferexpl.vim #################"
" See the buffer status in a tab-like fashion
" while you are working with mutiple buffers.
Bundle 'fholgado/minibufexpl.vim'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1
let g:miniBufExplForceSyntaxEnable = 1
                    " Handle FileExplorer window becomes smaller.
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
" Mapping for MBE
nnoremap <TAB> :MBEbn<CR>
noremap <leader>bn :MBEbn<CR>
noremap <leader>bp :MBEbp<CR>
noremap <leader>m :MBEToggle<CR>

"#################### Tagbar ######################"
" Tagbar is a vim plugin for browsing the tags of
" source code files.
Bundle 'majutsushi/tagbar'
nmap <F2> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"################# Taglist.vim ####################"
" A source code browser plugin for Vim
Bundle 'vim-scripts/taglist.vim'
set tags=tags;/
let Tlist_Ctags_Cmd="/usr/bin/ctags"
nnoremap <silent> <F3> :TlistToggle<CR>
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let Tlist_Auto_Update = 1
let Tlist_Close_On_Select = 0
let Tlist_Compact_Format = 0
let Tlist_Display_Prototype = 0
let Tlist_Display_Tag_Scope = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 0
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Hightlight_Tag_On_BufEnter = 1
let Tlist_Inc_Winwidth = 0
let Tlist_Max_Submenu_Items = 1
let Tlist_Max_Tag_Length = 30
let Tlist_Process_File_Always = 0
let Tlist_Show_Menu = 0
let Tlist_Show_One_File = 1
let Tlist_Sort_Type = "order"
let Tlist_Use_Horiz_Window = 0
let Tlist_Use_Right_Window = 0
let Tlist_WinWidth = 25

"################### Ctrlp.vim ####################"
" Finder with an intuitive interface.
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = '<leader>p'
let g:ctrlp_cmd = 'CtrlP'
map <C-f> :CtrlPMRU<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
                    " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
            \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
            \ }
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

"################# Vim-powerline ##################"
" Powerline is a utility plugin which allows you
" to create better-looking, more functional
" vim statuslines.
Bundle 'Lokaltog/vim-powerline'
"if want to use fancy,need to add font patch ->
" git clone git://gist.github.com/1630581.git
" ~/.fonts/ttf-dejavu-powerline
let g:Powerline_symbols = 'unicode'
"let g:Powerline_colorscheme = 'solarized256'

"############ Rainbow_parentheses.vim #############"
" Rainbow colors for parentheses
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 40
let g:rbpt_loadcmd_toggle = 0

"################### IndentLine ###################"
" Displaying thin vertical lines at each
" indentation level for code indented with spaces.
Bundle 'Yggdroot/indentLine'
let g:indentLine_noConcealCursor = 1
let g:indentLine_color_term = 0
let g:indentLine_char = '¦'

"########### Vim-trailing-whitespace ##############"
" To show no used whitespaces
Bundle 'bronson/vim-trailing-whitespace'

"############# Vim-colors-solarized ###############"
" Colorscheme solarized
Bundle 'altercation/vim-colors-solarized'
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"

"################### Molokai ######################"
" Colorscheme molokai
Bundle 'tomasr/molokai'
"let g:molokai_original = 1

"############### Vim-easymotion ###################"
" Faster movement + w/fx
Bundle 'Lokaltog/vim-easymotion'

"################## Matchit.zip ###################"
" Match the %
Bundle 'vim-scripts/matchit.zip'

"################ YouCompleteMe ###################"
" Completion plugin for C/C++, Python etc...
Bundle 'Valloric/YouCompleteMe'
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
"let g:ycm_global_ycm_extra_conf = '~/k-vim/bundle/YouCompleteMe/cpp/ycm/'
let g:ycm_confirm_extra_conf=0

"################### Ultisnips ####################"
" For quickly input codes blocks.
Bundle 'SirVer/ultisnips'
let g:snips_author = "Lee Long"
let g:snips_author_email = "lonely.hust@gmail.com"
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsSnippetDirectories=["bundle/ultisnips/UltiSnips", "snippets"]

"################ Nerdcommenter ###################"
" Quickly comment sentences.
Bundle 'scrooloose/nerdcommenter'

"################ Vim-surround ####################"
" The plugin provides mappings to easily delete,
" change and add such surroundings in pairs.
Bundle 'tpope/vim-surround'

"################## Vim-repeat ####################"
" For repeat -> enhance surround.vim
" . to repeat command.
Bundle 'tpope/vim-repeat'

"################# DelimitMate  ###################"
" automatic closing of quotes, parenthesis, brackets,
" etc.....
Bundle 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']
                    " For python docstring

"#################### Tabular #####################"
" For code alignment
Bundle 'godlygeek/tabular'
" nmap <Leader>a= :Tabularize /=<CR>
" vmap <Leader>a= :Tabularize /=<CR>
" nmap <Leader>a: :Tabularize /:\zs<CR>
" vmap <Leader>a: :Tabularize /:\zs<CR>

"############# Vim-expand-region ##################"
" For visual selection.
Bundle 'terryma/vim-expand-region'
"map = <Plug>(expand_region_expand)
"map - <Plug>(expand_region_shrink)

"############# Vim-multiple-cursors ###############"
" Multiple cursors for the editor.
Bundle 'terryma/vim-multiple-cursors'
" Default mappings for the plugin.
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"################### Syntastic ####################"
" Syntastic is a syntax checking plugin that runs
" files through external syntax checkers and
" displays any resulting errors to the user.
Bundle 'scrooloose/syntastic'
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
"let g:syntastic_python_checker="flake8,pyflakes,pep8,pylint"
let g:syntastic_python_checkers=['pyflakes']
highlight SyntasticErrorSign guifg=white guibg=black

"################ Pyflakes-vim ####################"
" A Vim plugin for checking Python code on the fly.
Bundle 'kevinw/pyflakes-vim'
let g:pyflakes_use_quickfix = 0

"################# TaskList.vim ###################"
" Task list based on the eclipse Task List.
Bundle 'vim-scripts/TaskList.vim'
map <leader>td <Plug>TaskList

"################# Vim-fugitive ###################"
" Vim plugin for git.
Bundle 'tpope/vim-fugitive'

"################### Gundo.vim ####################"
" A vim plugin to visualize your Vim undo tree.
Bundle 'sjl/gundo.vim'
nnoremap <leader>u :GundoToggle<CR>

"
"################ Syntax Highlights ###############"
"
"################ Python-syntax ###################"
" for python files's syntax highlight
Bundle 'hdima/python-syntax'
let python_highlight_all = 1

"################# Vim-golang #####################"
" For golang files's syntax highlight.
Bundle 'jnwhiteh/vim-golang'

"################# Vim-markdown ###################"
" For markdown files's syntax highlight.
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1

"############### Vim-javascript ###################"
" For javascript files's syntax highlight.
Bundle "pangloss/vim-javascript"
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"

"##################### Jquery #####################"
" For jquery files's syntax highlight.
Bundle 'nono/jquery.vim'

"############## Vim-jinja2-Syntax #################"
" For jinja2 files's syntax highlight.
Bundle 'Glench/Vim-Jinja2-Syntax'

"############### Nginx-vim-syntax #################"
" For nginx configure files's syntax highlight.
Bundle 'thiderman/nginx-vim-syntax'


"===============================================================================
"                   ->Colortheme   Themes settings
"===============================================================================
syntax enable       " syntax highlighting.
syntax on
set background=dark " set background color to dark.
" Change the themes and background colors.
colorscheme solarized
                    " themes solarized.
"colorscheme molokai
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

" settings for kien/rainbow_parentheses.vim
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces


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
