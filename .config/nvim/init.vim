" In case I am using fish shell
set shell=bash

" Python configuration for NVIM
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

" Terminal configuration for NVIM
:tnoremap <Esc> <C-\><C-n>
nnoremap ,t :terminal<CR>

" Common editor settings
set ruler
set cmdheight=2
set laststatus=2
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
set statusline+=%{fugitive#statusline()}
set title
set showcmd
set ignorecase
set hlsearch
set incsearch
set background=dark
set hidden
set showmatch
set number
set tabstop=2
set shiftwidth=2
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,default,latin
set fenc=utf-8
set enc=utf-8
set autoindent
set expandtab
set foldmethod=marker
set cursorline

" Disable swap.
set noswapfile

" Auto trailing space removal at saving.
autocmd BufWritePost * silent :%s/\s\+$//ge

" Always enable syntax mode.
syntax on

" Map Japanese-style back slask as leader key.
map ¥ <leader>

" JSON formatting in virtual mode
vnoremap <silent> <C-J> :!python -m json.tool<CR>

" Press Ctrl-Q three times to all quit
nnoremap <C-Q><C-Q><C-Q> :qa!<CR>

" Press ,cd to make CWD same as path that currently opened.
nnoremap <silent> ,cd :cd %:p:h<CR>
" Press ,fo to do :foldo
" Press ,fc to do :foldc
nnoremap <silent> ,fo :foldo<CR>
nnoremap <silent> ,fc :foldc<CR>
" Press ,N to do :nohl
nnoremap <silent> ,N :nohl<CR>
" Press ,n / ,p to do :cn / :cp
nnoremap <silent> ,n :cn<CR>
nnoremap <silent> ,p :cp<CR>
" Press ,+ / ,-  |  ,< / ,> to do window resizing.
nnoremap <silent> ,+ 5<C-W>+
nnoremap <silent> ,- 5<C-W>-
nnoremap <silent> ,< 5<C-W><
nnoremap <silent> ,> 5<C-W>>


" =====================================================================
" NeoBundle
" =====================================================================
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" anything.el in Vim
NeoBundle 'Shougo/unite.vim'
" Enable snippet function
NeoBundle 'Shougo/neosnippet.vim'
" Snippet sets
NeoBundle 'Shougo/neosnippet-snippets'
" Vim git plugin
NeoBundle 'tpope/vim-fugitive'
" Ctrl _ _ to toggle comment.
NeoBundle 'tomtom/tcomment_vim'
" Enable :Unite file_mru (remapped to ,uu)
NeoBundle 'Shougo/neomru.vim'
" :Unite -auto-preview colorscheme to preview colorschemes.
NeoBundle 'ujihisa/unite-colorscheme'
" Filer
NeoBundle 'Shougo/vimfiler.vim'
" Execute code snippet within Vim window.
NeoBundle 'thinca/vim-quickrun'
" Python Plugin
NeoBundle 'davidhalter/jedi-vim'
" Status line customize
NeoBundle 'itchyny/lightline.vim'
" Undo tree
NeoBundle 'sjl/gundo.vim'
" AlpacaTags
NeoBundle 'alpaca-tc/alpaca_tags'
" CoffeeScript highlighting / auto-compile
NeoBundle 'kchmck/vim-coffee-script'
" Rails
NeoBundle 'tpope/vim-rails'
" Syntastic
NeoBundle 'scrooloose/syntastic'
" Indent guide
NeoBundle 'nathanaelkane/vim-indent-guides.git'
" deoplete
NeoBundle 'Shougo/deoplete.nvim'
" pug (jade)
NeoBundle 'digitaltoad/vim-pug.git'
" vimproc: enables external grep
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
" Snippets
NeoBundle 'honza/vim-snippets'
" Ruby Support
NeoBundle 'vim-ruby/vim-ruby'
" Ansible helper
NeoBundle 'chase/vim-ansible-yaml'

" Favorite 3rd party color schemes (background: dark)
NeoBundle 'itchyny/landscape.vim'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'tpope/vim-surround'
NeoBundle 'leafgarland/typescript-vim'
NeoBundle 'Quramy/tsuquyomi'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" =====================================================================
" fugitive
" =====================================================================
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>
nnoremap <silent> ,gg :Ggrep


" =====================================================================
" neosnippet
" =====================================================================

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets/neosnippets'
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory = [
"       \'~/.vim/snippets',
"       \'~/.vim/bundle/neosnippet-snippets/neosnippets',
"       \]
" =====================================================================
" Unite
" =====================================================================

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 7777
" Use ag for Unite grep
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite -auto-preview colorscheme<CR>
nnoremap <silent> ,ug :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>


" =====================================================================
" VimFiler
" =====================================================================

" ,vf to launch VimFiler.
nnoremap ,vf :VimFiler -split -simple -winwidth=35 -no-quit<CR>


" =====================================================================
" Quickrun
" =====================================================================

" Holizontally split window & customize window height
let g:quickrun_config = {
\   "_" : {
\       "outputter/buffer/split" : ":botright",
\       "outputter/buffer/close_on_empty" : 1
\   },
\}

nnoremap <silent> ,q<CR> :QuickRun<CR>
nnoremap <silent> ,qpy   :QuickRun python<CR>
nnoremap <silent> ,qrb   :QuickRun ruby<CR>
nnoremap <silent> ,qsh   :QuickRun shell<CR>

" =====================================================================
" jedi-vim
" =====================================================================

" Do not show docstring during completion
autocmd FileType python setlocal completeopt-=preview

" Neocomplete configuration.
autocmd FileType python setlocal omnifunc=jedi#completions



" =====================================================================
" Lightline
" =====================================================================

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'mode_map': { 'c': 'NORMAL' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? '[RO]' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ':'._ : ''
  endif
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


" =====================================================================
" Gundo
" =====================================================================
nnoremap <silent> ,gu :GundoToggle<CR>

" =====================================================================
" AlpacaTags
" =====================================================================
augroup AlpacaTags
  autocmd!
  if exists(':Tags')
    autocmd BufWritePost Gemfile TagsBundle
    autocmd BufEnter * TagsSet
    " 毎回保存と同時更新する場合はコメントを外す
    " autocmd BufWritePost * TagsUpdate
  endif
augroup END


" =====================================================================
" CoffeeScript
" =====================================================================
au BufRead,BufNewFile,BufReadPre *.coffee   set filetype=coffee
autocmd FileType coffee     setlocal sw=2 sts=2 ts=2 et
autocmd QuickFixCmdPost * nested cwindow | redraw!
nnoremap <silent> ,cc :CoffeeCompile vert <CR><C-w>h

" =====================================================================
" Syntastic
" =====================================================================
let g:syntastic_python_checkers = ['mypy', 'flake8', 'py2kwarn']
let g:syntastic_python_python_exec = '/usr/local/bin/python3'
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
nnoremap <silent> <leader>s :SyntasticCheck <CR>

" =====================================================================
" Autopep8
" =====================================================================
function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! Autopep8()
    call Preserve(':silent %!autopep8 -')
endfunction

" Execute autopep8 with <leader>+p
autocmd FileType python nnoremap <leader>p :call Autopep8()<CR>


" =====================================================================
" Indent Guide
" =====================================================================
let g:indent_guides_enable_on_vim_startup = 1


" =====================================================================
" FZF
" =====================================================================
set rtp+=/usr/local/opt/fzf
nnoremap <silent> ,fz :FZF<CR>


" =====================================================================
" TypeScript
" =====================================================================
autocmd FileType typescript setlocal completeopt+=menu,preview
autocmd FileType typescript nmap <buffer> <Leader>t : <C-u>echo tsuquyomi#hint()<CR>
let g:tsuquyomi_completion_detail = 0
let g:tsuquyomi_disable_quickfix = 0
let g:syntastic_typescript_checkers = ['tsuquyomi', 'tslint'] " You shouldn't use 'tsc' checker.

colorscheme molokai
