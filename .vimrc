" Patrick Corrigan's VIMRC
" Last modified Sunday Feburary 16th 2014
"
"
" ================ General =====================================================
set mouse=c
set spelllang=en_gb
set wildmenu
set t_Co=256
set modelines=0
set nocompatible
set backspace=2
set hidden
set shortmess+=I
" ================ Wrapping  ===================================================
set textwidth=80
set colorcolumn=+1
set cursorline
set cursorcolumn

" ================" Search======================================================
"set foldmethod=syntax
set ignorecase
set incsearch
set smartcase

" ================ Backups =====================================================
set backupdir=~/.vim/vimfiles/backup
set directory=~/.vim/vimfiles/temp

"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup

"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup

" ================ Status ======================================================
set number "Line numbers
set ruler
set laststatus=2 "Always keeps the status bar active
set showcmd

" ================ Syntax Highlighting =========================================
filetype off
syntax enable
filetype plugin indent on

" ================ Tabs ========================================================
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent

" ================ Pathogen ====================================================
" autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'scrooloose/nerdtree'
Bundle 'gmarik/vundle'
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-scripts/Cleanroom'
Bundle 'lsdr/monokai'
Bundle 'chriskempson/base16-vim'
Bundle 'baeuml/summerfruit256.vim'
Bundle 'vim-scripts/vimwiki'
Bundle 'jnurmine/Zenburn'
Bundle 'junegunn/seoul256.vim'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-commentary'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'sandeepravi/refactor-rails.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'edkolev/tmuxline.vim'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'Shougo/unite.vim'
Bundle 'Shougo/vimproc.vim'
Bundle 'sjl/gundo.vim'
Bundle 'kbarrette/mediummode'
Bundle 'kchmck/vim-coffee-script'

" ================ Colour Scheme " =============================================
if has('gui_running')
    colorscheme base16-twilight
else
    colorscheme zenburn
endif

" ================ Leader Commands " ===========================================
let mapleader = ","
map <space> <leader>
nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>rt :!rspec spec/*<CR>
nnoremap <Leader>c :!
nnoremap <Leader>td :e ~/documents/todo<CR>
nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>f :CtrlP<CR>
nnoremap <Leader>y "+Y
nnoremap <Leader>sy "*Y
noremap  <Leader>p "+p<CR>
nnoremap <Leader>P "+P<CR>
noremap  <Leader>sep "*p<CR>
nnoremap <Leader>seP "*P<CR>
nnoremap <Leader>h :set hlsearch!<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>; :b #<CR>
nnoremap <Leader>e :e ~/.vimrc<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>d :set background=light<CR>
nnoremap <Leader>n :set background=dark<CR>
nnoremap <Leader>rs :%s/\s\+$//<CR>
nnoremap <Leader>co :call ToggleAlignmentColumns()<CR>
nnoremap <Leader>ca :Calc
nnoremap <Leader>r :vertical resize 85<CR>
nnoremap <Leader>sp :set spell!<CR>

let g:airline_powerline_fonts=1
let g:ctrlp_by_filename=1
" let g:airline#extensions#tabline#enabled = 1

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L
set guioptions-=e
set guioptions+=c
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10

if has("autocmd")
    " filetype indent on
endif
imap jf <Esc>
cmap jf <Esc>
" let g:EclimCompletionMethod = 'omnifunc'
imap <C-K> <Plug>snipMateNextOrTrigger
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap * *N


call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <leader>f :<C-u>Unite -start-insert file_rec/async:!<CR>

function! ToggleAlignmentColumns()
    if &colorcolumn == '+1'
        set colorcolumn=4,8,12,16,20,24,+1
    else
        set colorcolumn=+1
    endif
endfunction

" Highlight Word {{{
"
" This mini-plugin provides a few mappings for highlighting words temporarily.
"
" Sometimes you're looking at a hairy piece of code and would like a certain
" word or two to stand out temporarily.  You can search for it, but that only
" gives you one color of highlighting.  Now you can use <leader>N where N is
" a number from 1-6 to highlight the current word in a specific color.

function! HighlightInterestingWord(n) " {{{
    " Save our location.
    normal! mz

    " Yank the current word into the z register.
    normal! "zyiw

    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n

    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)

    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'

    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)

    " Move back to our original location.
    normal! `z
endfunction " }}}

" Mappings {{{

nnoremap <silent> <leader>1 :call HighlightInterestingWord(1)<cr>
nnoremap <silent> <leader>2 :call HighlightInterestingWord(2)<cr>
nnoremap <silent> <leader>3 :call HighlightInterestingWord(3)<cr>
nnoremap <silent> <leader>4 :call HighlightInterestingWord(4)<cr>
nnoremap <silent> <leader>5 :call HighlightInterestingWord(5)<cr>
nnoremap <silent> <leader>6 :call HighlightInterestingWord(6)<cr>
nnoremap <silent> <leader>0 :call clearmatches()<cr>h


" }}}
" Default Highlights {{{

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b8f8f3 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

" }}}
" }}}
"

:command! -nargs=+ Calc :py print <args>
:py from math import *
:py from cmath import *

" function! NeatFoldText() "{{{2
"   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"   let lines_count = v:foldend - v:foldstart + 1
"   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"   let foldchar = matchstr(&fillchars, 'fold:\zs.')
"   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"   let foldtextend = lines_count_text . repeat(foldchar, 8)
"   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction
" set foldtext=NeatFoldText()
" " }}}2
" Git test
"
set cm=blowfish

let wiki_1 = {}
let wiki_1.path = '~/documents/vimwiki'
let g:vimwiki_list = [wiki_1]
