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
set smartcase
set hlsearch
set incsearch
set background=dark
set hidden
set showmatch
set number
set tabstop=2
set shiftwidth=2
set fileencodings=iso-2022-jp,utf-8,cp932,euc-jp,default,latin
set fenc=utf-8
set enc=utf-8
set autoindent
set expandtab

" Auto trailing space removal at saving.
autocmd BufWritePost * silent :%s/\s\+$//ge

" Default colorscheme.
colorscheme Wombat

" Always enable syntax mode.
syntax on

" JSON formatting in virtual mode
vnoremap <silent> <C-J> :!python -m json.tool<CR>

" Press Ctrl-Q three times to all quit
nnoremap <C-Q><C-Q><C-Q> :qa!<CR>

" Python only
autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal tabstop=2
autocmd FileType python setlocal shiftwidth=2

" Press ,cu to make CWD same as path that currently opened.
nnoremap <silent> ,cu :cd %:p:h<CR>

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
NeoBundle 'Shougo/neocomplcache.vim'
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
" Automatically indicates current indents.
NeoBundle 'nathanaelkane/vim-indent-guides'
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
" Favorite 3rd party color schemes (background: dark)
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
" neocomplcache
" =====================================================================
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Enable heavy features.
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplcache#close_popup() : "\<Space>"

" For cursor moving in insert mode(Not recommended)
"inoremap <expr><Left>  neocomplcache#close_popup() . "\<Left>"
"inoremap <expr><Right> neocomplcache#close_popup() . "\<Right>"
"inoremap <expr><Up>    neocomplcache#close_popup() . "\<Up>"
"inoremap <expr><Down>  neocomplcache#close_popup() . "\<Down>"
" Or set this.
"let g:neocomplcache_enable_cursor_hold_i = 1
" Or set this.
"let g:neocomplcache_enable_insert_char_pre = 1

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" =====================================================================
" fugitive
" =====================================================================
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}
nnoremap <silent> ,gs :Gstatus<CR>
nnoremap <silent> ,gb :Gblame<CR>
nnoremap <silent> ,gc :Gcommit<CR>

" =====================================================================
" vim-indent-guides
" =====================================================================
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=110
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=140
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_guide_size=1

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
let g:unite_source_file_mru_limit = 200
nnoremap <silent> ,uy :<C-u>Unite history/yank<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nnoremap <silent> ,ur :<C-u>Unite -buffer-name=register register<CR>
nnoremap <silent> ,uu :<C-u>Unite file_mru buffer<CR>
nnoremap <silent> ,uc :<C-u>Unite -auto-preview colorscheme<CR>

" =====================================================================
" Vimshell
" =====================================================================

let g:vimshell_prompt_expr = 'getcwd()." > "'
let g:vimshell_prompt_pattern = '^\f\+ > '
nnoremap <silent> ,is :VimShell<CR>
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
" References
" =====================================================================
"
" - Plugins
"   http://qiita.com/jnchito/items/5141b3b01bced9f7f48f
" - VimFiler
"   http://www.karakaram.com/vimfiler
