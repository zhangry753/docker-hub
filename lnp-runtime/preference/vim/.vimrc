" settings for vim
"
""======================================================
" vim-plug设置
""======================================================
set nocompatible	" explicitly get out of vi-compatible mode
silent! call plug#begin()
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ervandew/supertab'
Plug 'preservim/nerdcommenter'
call plug#end()
" 插件设置
"NERDTree setting
" let g:nerdtree_tabs_open_on_console_startup=1
"没有编辑窗口时关闭所有窗口
autocmd BufEnter * if 0 == len(filter(range(1, winnr('$')), 'empty(getbufvar(winbufnr(v:val), "&bt"))')) | qa | endif

""======================================================
" 快捷键 
""======================================================
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>
noremap <F10> oprint(json_encode($));<CR>die(0);<Esc>k$2hi
"noremap <F10> ovar_dump($);<CR>die(0);<Esc>k4li
noremap <F11> o\Common::debug($);<Esc>2ha
map <F12> :set number!<CR>
map <F4> :call PhpCheckSyntax()<CR>
imap <F4> <ESC>:call PhpCheckSyntax()<CR>
autocmd BufWritePost *.php :call PhpCheckSyntax()
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

""======================================================
" vim设置 
""======================================================
set number
syntax on						" syntax highlighting on
" filetype on					" load filetype plugins/indent settings
set mouse=nvih					" enable mouse in all mode except command mode
set backspace=indent,eol,start	" make backspace a more flexible
set fileformats=unix,dos,mac	" support all three, in this order
set hidden						" you can change buffers without saving
set iskeyword+=_,$,@,%,#		" none of these are word dividers
set noerrorbells				" don't make noise
set whichwrap=b,s,h,l,<,>,~,[,]	" everything wraps
set wildmenu					" turn on command line completion wild style
set wildignore=*.dll,*.o,*.obj,*.exe,*.pyc,*.jpg,*.gif,*.png,*.aux,*.class
set wildmode=list:longest		" turn on wild mode huge list
set incsearch					" BUT do highlight as you type you search phrase
set laststatus=2				" always show the status line
set lazyredraw					" do not redraw while running macros
set linespace=0					" don't insert any extra pixel lines betweens rows
set listchars=tab:>-,trail:-	" show tabs and trailing
set matchtime=5					" how many tenths of a second to blink matching brackets for
set nohlsearch					" do not highlight searched for phrases
set nostartofline				" leave my cursor where it was
set novisualbell				" don't blink
set report=0					" tell us when anything is changed via :...
set ruler						" Always show current positions along the bottom
set scrolloff=10				" Keep 10 lines (top/bottom) for scope
set shortmess=aOstT				" shortens messages to avoid 'press a key' prompt
set showcmd						" show the command being typed
set showmatch					" show matching brackets
set sidescrolloff=10			" Keep 5 lines at the size
set statusline=%F%m%r%h%w[%L][%{&ff}]%y[%p%%][%04l,%04v]
set expandtab					" no real tabs please!
set smartindent
set formatoptions=rq			" Automatically insert comment leader on return, and
set ignorecase					" case insensitive by default
set infercase					" case inferred by default
set nowrap						" do not wrap line
set shiftround					" when at 3 spaces, and I hit > ... go to 4, not 5
set smartcase					" if there are caps, go case-sensitive
set shiftwidth=4				" auto-indent amount when using cindent,
set softtabstop=4				" when hitting tab or backspace, how many spaces
set tabstop=4					" real tabs should be 8, and they will show with set list on
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,default,latin1
set hlsearch					" highlighting on search text
if &diff
    colorscheme evening-lighter
endif

"自动补全配置
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" 设置自动折叠，不需要可以去掉
set autoindent
set fdm=indent
set fdl=1

" 记忆上次浏览位置
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 删除不覆盖剪贴板
nnoremap x	"_x
nnoremap X	"_X
nnoremap d	"_d
nnoremap dd	"_dd
nnoremap D	"_D
vnoremap d	"_d
vnoremap dd	"_dd

" 括号自动补全
"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap { {}<Esc>i


"======================================================
""PHP语法检查
"======================================================
function! PhpCheckSyntax()
    " Check php syntax
    setlocal makeprg=\php\ -l\ -n\ -d\ html_errors=off\ %

    " Set shellpipe
    setlocal shellpipe=>

    " Use error format for parsing PHP error output
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
    execute "silent make %"
    set makeprg=make
    execute "normal :"
    " execute "copen"
    execute "clist"
endfunction

