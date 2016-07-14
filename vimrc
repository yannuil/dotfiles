" No compatible
set nocp

" This below helps META / ALT to work in the terminal
let c='a'
while c <= 'z'
	exec "set <A-".c.">=\e".c
	exec "imap \e".c." <A-".c.">"
	let c = nr2char(1+char2nr(c))
endw

set ttimeout
set ttimeoutlen=50

" Add vim bundle to runtimepath
" And pathogen.vim is available to us.
set runtimepath+=/home/yann/.vim_runtime

" Powerline
" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Load pathogen paths
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect('~/.vim_runtime/vim_bundles/{}')
" Add the docs
execute pathogen#helptags()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=10000

" Enable filetype plugins
filetype plugin indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Completion popup menu
" http://vim.wikia.com/wiki/Make_Vim_completion_popup_menu_work_just_like_in_an_IDE
set completeopt=longest,menuone ",preview No preview window at top.
" inoremap <expr> <CR> pumvisible() ? '\<C-y>' : '\<C-g>u\<CR>'
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'


" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" For regular expressions turn magic on
set magic

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Makes search act like search in modern browsers
set incsearch

" Show command typed
set showcmd

" set list then display tab and space as characters
set listchars=tab:\|-,nbsp:·,trail:-,extends:#


" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set so=10

"Always show current position
set ruler

" Add a bit extra margin to the left
set foldcolumn=1

" Show line number
set relativenumber
set number
"
" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Highlight search results
set hlsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set mouse=a  " Automatically enable mouse usage
set virtualedit=onemore " Allow for cursor beyond last character
set mousehide " Hide mouse when typing

" Scroll Color
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

" Folding
set nofoldenable
set foldmethod=syntax
set foldlevel=1

fu! ShowFunctionNameFoldText()
  "get first non-blank line
  let fs = v:foldstart
  while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
  endwhile
  if fs > v:foldend
    let line = getline(v:foldstart)
  else
    let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
  endif

  let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
  let foldSize = 1 + v:foldend - v:foldstart
  let foldSizeStr = " " . foldSize . " lines "
  let foldLevelStr = repeat("+--", v:foldlevel)
  let lineCount = line("$")
  let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
  let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
  return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

set foldtext=ShowFunctionNameFoldText()

set conceallevel=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set customed color scheme
set background=dark

" if !has("gui_running")
" 	let g:rehash256 = 1
" endif

" colorscheme molokai
" colorscheme xoria256
colorscheme mango

set t_Co=256


" Set extra options when running in GUI mode
if has("gui_running")
	set guioptions-=m
	set guioptions-=b
	set guioptions-=h
    set guioptions-=T
    set guioptions-=e
    set guitablabel=%M\ %t
	" Disable scrollbars (real hackers don't use scrollbars for navigation!)
	set guioptions-=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L

	set guiheadroom=0
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

set linespace=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab = 4 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
set lbr
set tw=500

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

set ai "Auto indent
set si "Smart indent

set nowrap "Wrap lines

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType javascript setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2
autocmd FileType javascript.jsx setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
"map <space> /
"map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Specify the behavior when switching between buffers
set switchbuf=useopen
set showtabline=0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" Making it so ; works like : for commands.
" Saves typing and eliminates :W style typos due to lazy holding shift.
nnoremap ; :


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" copy/paste to/from x clipboard
" On MacOS
" vmap <leader>y :w !pbcopy<cr><cr>
" map <leader>p :r!pbpaste<cr><cr>
" With xsel package
" vmap <leader>y :w !xsel --clipboard --input<cr><cr>
" map <leader>p :r!xsel --clipboard --output<cr><cr>
" Or with xclip package
vmap <leader>y :!xclip -f -sel clip<CR>
map <leader>p :-1r !xclip -o -sel clip<CR>


" Yank entire file (global yank)
nmap gy ggVGy

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Remap VIM 0 to first non-blank character
map 0 ^

" Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if has("mac") || has("macunix")
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" Do not need it because python-mode plugin
"autocmd BufWrite *.py :call DeleteTrailingWS()
"autocmd BufWrite *.coffee :call DeleteTrailingWS()
"autocmd BufWrite *.js :call DeleteTrailingWS()

" Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>

" Sane indentation on pastes
set pastetoggle=<F12>

" Toggle paste mode on and off
map <leader>pp :setlocal paste!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Visual mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" indent visual selected code without unselecting and going back to normal mode
vmap > >gv
vmap < <gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =><leader> mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast saving
nmap <leader>w :w!<cr>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader>, :noh<cr>

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,1000 bd!<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Fast editing and reloading of vimrc configs
map <leader>e :e! ~/.vimrc<cr>
autocmd! bufwritepost .vimrc source ~/.vimrc

" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
" Next error
" map <leader>sn ]s
" map <leader>sp [s
" Add word into dictionary
map <leader>sa zg
" Show suggestions.
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
"    means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
"cno $d e ~/Desktop/

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>
cnoremap <C-P> <Up>
cnoremap <C-N> <Down>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.' . a:extra_filter)
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => bufExplorer plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:bufExplorerDefaultHelp=0
"let g:bufExplorerShowRelativePath=1
"let g:bufExplorerFindActive=1
"let g:bufExplorerSortBy='name'
"map <leader>o :BufExplorer<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MRU plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let MRU_File = '~/.vim_runtime/temp_dirs/vim_mru_files'
"let MRU_Max_Entries = 1000
"map <leader>f :MRU<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_cache_omnifunc = 0

" Seed its identifier database with the keywords of the programming language you're writing
let g:ycm_seed_identifiers_with_syntax = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CTRL-P
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ctrlp_working_path_mode = 0

"" Make CtrlP use ag for listing the files. Way faster and no useless files.
"let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
"let g:ctrlp_map = '<c-f>'

"let g:ctrlp_max_height = 15
"let g:ctrlp_custom_ignore = 'node_modules\|^\.DS_Store\|^\.git\|^\.coffee'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ZenCoding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable all functions in all modes
" let g:user_zen_mode='a'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>nn :NERDTreeToggle<cr>
" map <leader>nb :NERDTreeFromBookmark
" map <leader>nf :NERDTreeFind<cr>
" let NERDTreeShowHidden=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => python-mode
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pymode_indent = 0
let g:pymode_lint_checker = "pyflakes"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ackprg="ag --vimgrep --smart-case"
nmap <leader>a yiw:Ack! "<cword>" <CR>
nmap <leader>A yiW:Ack! "<cword>" <CR>
vmap <leader>a y:Ack! "<cword>" <CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => DelimitMate
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" put cursor between on enter
let delimitMate_expand_cr = 1
imap <expr><CR> pumvisible() ? "\<C-n>" : "<Plug>delimitMateCR"
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent Guides
" Enable indent guides on boot and allow colorschemes to style them.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=1
let g:indent_guides_start_level=2
let g:indent_guides_color_change_percent=100
let g:indent_guides_guide_size=1

"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#1c1c1c ctermbg=234
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#303030 ctermbg=254

nmap <silent><leader>i :IndentGuidesToggle<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pangloss/vim-javascript
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:javascript_conceal = 1

let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easymotion/vim-easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" " Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
" type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" haya14buse/incsearch.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bling/vim-aireline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme='murmur'


" shortform text for mode
let g:airline_mode_map = {
	\ '__' : '-',
	\ 'n'  : 'N',
	\ 'i'  : 'I',
	\ 'R'  : 'R',
	\ 'c'  : 'C',
	\ 'v'  : 'V',
	\ 'V'  : 'V',
	\ '' : 'V',
	\ 's'  : 'S',
	\ 'S'  : 'S',
	\ '' : 'S',
	\ }

if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇ '
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_symbols.space = "\ua0"

" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

let g:airline_powerline_fonts = 1

" Top tab line
"let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#bufferline#enabled = 0

" certain number of spaces are allowed after tabs, but not in between
" this algorithm works well for /** */ style comments in a tab-indented file
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#checks = ['indent']

" customize the whitespace symbol.
let g:airline#extensions#whitespace#symbol = '!'

"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" bling/vim-bufferline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bufferline_rotate = 1
let g:bufferline_fixed_index = 0
let g:bufferline_show_bufnr = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" scrooloose/syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_auto_jump=1
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" millermedeiros/vim-esformatter
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" will run esformatter after pressing <leader> followed by the 'e' and 's' keys
nnoremap <silent> <leader>f :Esformatter<CR>
vnoremap <silent> <leader>f :EsformatterVisual<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sjl/gundo.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F5> :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-ctrlspace/vim-ctrlspace
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

" Open fuzzy search file mode like ctrl-p
" nnoremap <silent><C-p> :CtrlSpace O<CR>
nnoremap <silent><C-g> :CtrlSpace H<CR>

let g:CtrlSpaceSearchTiming = 5


" Save workspace automatically
let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

hi link CtrlSpaceNormal LineNr
hi link CtrlSpaceSelected DiffAdd

" Fold color
hi clear Folded
hi link Folded MoreMsg
hi clear FoldColumn
hi link FoldColumn Comment

" Comment color
hi Comment term=standout ctermfg=6 ctermbg=235 guifg=Cyan guibg=Grey

" Conceal
hi clear Conceal
hi link Conceal Operator

" Javascript object function key
hi link jsFunctionKey SpecialChar

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shougo/unite.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call unite#custom#source('buffer,file,file_rec,file/new,file_rec/async',
      \ 'matchers', ['converter_relative_word', 'matcher_fuzzy'])
call unite#custom#source('buffer,file,file_rec, file/new,file_rec/async',
      \ 'sorters', 'sorter_selecta')

call unite#custom#source('file,file_rec, file/new,file_rec/async',
      \ 'converters', 'converter_file_directory')

call unite#custom#profile('default', 'context', {
\ 'start_insert': 1,
\ 'multi_line': 1,
\ 'direction': 'botright',
\ })

let g:unite_data_directory='~/.vim_runtime/temp_dirs/unite'

if executable('ag')
  let g:unite_source_rec_async_command = ['ag', '--follow', '--nocolor', '--nogroup', '--hidden', '-g', '']

  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts =
	\ '--nocolor --line-numbers --nogroup --smart-case --ignore-case --hidden ' .
	\ '--ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
  let g:unite_source_grep_recursive_opt=''
endif

hi link uniteCandidateInputKeyword DiffAdd

nnoremap [unite] <nop>
nmap <space> [unite]

nnoremap <silent> [unite]<space>  :<C-u>UniteWithCurrentDir -buffer-name=files -toggle -auto-resize bookmark buffer file_rec/async file/new<CR>
nnoremap <silent> [unite]p 	  :<C-u>UniteWithProjectDir -buffer-name=files -toggle -auto-resize file_rec/async<CR>
nnoremap <silent> [unite]P 	  :<C-u>UniteWithProjectDir -buffer-name=search -no-quit grep<CR>
nnoremap <silent> [unite]s 	  :<C-u>Unite -buffer-name=qbuffers -quick-match buffer<CR>
nnoremap <silent> [unite]l 	  :<C-u>Unite -buffer-name=line -auto-resize line<CR>
nnoremap <silent> [unite]/ 	  :<C-u>UniteWithCurrentDir -buffer-name=search -no-quit grep<CR>
nnoremap <silent> [unite]m 	  :<C-u>Unite -buffer-name=mappings -toggle -auto-resize mapping<CR>

" Require https://github.com/Shougo/neomru.vim
"nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=recent file_mru<cr>
" Require https://github.com/Shougo/neoyank.vim
"let g:unite_source_history_yank_enable=1
"nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SCSS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile *.scss set filetype=scss.css
autocmd FileType scss.css set iskeyword+=-


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" zhaocai/GlodenView.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goldenview__enable_at_startup = 0
let g:goldenview__enable_default_mapping = 0
