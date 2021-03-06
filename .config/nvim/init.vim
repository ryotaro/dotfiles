" Install dein.vim before running this file via following command..
" bash <(curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh) ~/.cache/dein


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
" Dein
" =====================================================================



"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/ryotaro/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/ryotaro/.cache/dein')
  call dein#begin('/home/ryotaro/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/ryotaro/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('chase/vim-ansible-yaml')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('digitaltoad/vim-pug.git')
  call dein#add('honza/vim-snippets')
  call dein#add('itchyny/lightline.vim')
  call dein#add('scrooloose/syntastic')
  call dein#add('sjl/gundo.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('tomasr/molokai')
  call dein#add('tomtom/tcomment_vim')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tpope/vim-surround')
  call dein#add('ujihisa/unite-colorscheme')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

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
nnoremap <silent> ,gc :Gcommit -S<CR>
nnoremap <silent> ,gg :Ggrep

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
    " autocmd BufWritePost * TagsUpdate
  endif
augroup END

" =====================================================================
" Syntastic
" =====================================================================
let g:syntastic_python_checkers = ['mypy', 'flake8', 'py2kwarn']
let g:syntastic_python_python_exec = '/usr/bin/python3'  " Ubuntu16.04 default
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
" FZF
" =====================================================================
set rtp+=/usr/local/opt/fzf
nnoremap <silent> ,fz :FZF<CR>

colorscheme molokai
