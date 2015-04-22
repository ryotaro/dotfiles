" =====================================================================
" My configurations
" =====================================================================

" In case I am using fish shell
set shell=bash

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
set tabstop=4
set shiftwidth=4
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
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
" Press ,+ / ,- to do window resizing.
nnoremap <silent> ,+ 10<C-W>+
nnoremap <silent> ,- 10<C-W>-


" =====================================================================
" NeoBundle
" =====================================================================
if has('vim_starting')
  set nocompatible               " Be iMproved

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

" Enable auto completion.
NeoBundle 'Shougo/neocomplete.vim'
" anything.el in Vim
NeoBundle 'Shougo/unite.vim'
" Required to execute vimshell (add automated make)
NeoBundle 'Shougo/vimproc', {
    \ 'build' : {
    \     'windows' : 'make -f make_mingw32.mak',
    \     'cygwin'  : 'make -f make_cygwin.mak',
    \     'mac'     : 'make -f make_mac.mak',
    \     'unix'    : 'make -f make_unix.mak',
    \    },
    \ }
" Enable vimshell
NeoBundle 'Shougo/vimshell'
" Enable snippet function
NeoBundle 'Shougo/neosnippet.vim'
" Snippet sets
NeoBundle 'Shougo/neosnippet-snippets'
" Vim git plugin
NeoBundle 'tpope/vim-fugitive'
" Ctrl _ _ to toggle comment.
NeoBundle 'tomtom/tcomment_vim'
" yss -> Insert ' , ds' -> Delete '.
NeoBundle 'tpope/vim-surround'
" Set ft=ruby.serverspec to enable serverspec snippets.
NeoBundle 'glidenote/serverspec-snippets'
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

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck


" =====================================================================
" Neocomplete
" =====================================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplete#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplete#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplete#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplete#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplete#enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplete#enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


" =====================================================================
" fugitive
" =====================================================================
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>


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

let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/bundle/serverspec-snippets',
      \'~/.vim/bundle/vim-snippets/snippets'
      \]


" =====================================================================
" Unite
" =====================================================================

let g:unite_enable_start_insert=1
let g:unite_source_history_yank_enable =1
let g:unite_source_file_mru_limit = 1000
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite -auto-preview colorscheme<CR>

" =====================================================================
" Vimshell
" =====================================================================

let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '
nnoremap <silent> ,is :VimShellPop<CR>
nnoremap <silent> ,ipy :VimShellInteractive python<CR>
nnoremap <silent> ,irb :VimShellInteractive irb<CR>
vmap <silent> ,ss :VimShellSendString<CR>
nnoremap <silent> ,ss <S-v>:VimShellSendString<CR>

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
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0

if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
endif

" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w*'

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

" =====================================================================
" Syntastic
" =====================================================================
let g:syntastic_python_checkers = ['flake8']

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
" References
" =====================================================================
"
" - Plugins
"   http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
" - VimFiler
"   http://www.karakaram.com/vimfiler
"
colorscheme molokai
