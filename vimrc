
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug '907th/vim-auto-save'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'dense-analysis/ale'
Plug 'taketwo/vim-ros'
Plug 'xolox/vim-easytags'
Plug 'xolox/vim-misc'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'aklt/plantuml-syntax'
Plug 'kamykn/spelunker.vim'
Plug 'ianva/vim-youdao-translater'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'wincent/command-t'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'terryma/vim-multiple-cursors'
Plug 'mbbill/undotree'
Plug 'preservim/nerdcommenter'
Plug 'skywind3000/asyncrun.vim'
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'mhinz/vim-startify'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => base
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
set number
set relativenumber
set title
set sts=2
set ts=2
set sw=2
" The width of a TAB is set to 2.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 2.
set tabstop=2
set shiftwidth=2    " Indents will have a width of 2
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces
set hlsearch
set undofile
set undodir=$HOME/.vim/undo  "directory where the undo files will be stored
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nmap <C-_>   <Plug>NERDCommenterToggle<CR>
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => autoformat
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <F4> :Autoformat<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-auto-save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:auto_save = 1  " enable AutoSave on Vim startup


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1 " tab number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F3> :NERDTreeToggle<CR>
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
			\ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => You complete me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_auto_hover = ''
nmap <F1> <plug>(YCMHover)
nnoremap <F7> :YcmCompleter GoToReferences<CR>
nnoremap <F8> :YcmCompleter GoToDefinition<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => ctrlp
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ctrlp_map = '<c-p>'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => CurtineIncSw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute "set <M-o>=\eo"
map <M-o> :call CurtineIncSw()<CR>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-youdao-translater
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => skywind3000/asyncrun.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" automatically open quickfix window when AsyncRun command is executed
" set the quickfix window 6 lines height.
let g:asyncrun_open = 8

" ring the bell to notify you job finished
let g:asyncrun_bell = 1

nnoremap <F12> :call asyncrun#quickfix_toggle(8)<cr>
imap <F12> <esc>:call asyncrun#quickfix_toggle(8)<cr>

" run
autocmd FileType python map <buffer> <F5> :AsyncRun python3 %<CR>
autocmd FileType python imap <buffer> <F5> <esc>:AsyncRun python3 %<CR>
autocmd FileType cpp map <buffer> <F5> :AsyncRun (cd build && make -j7)<CR>
autocmd FileType cpp imap <buffer> <F5> <esc>:AsyncRun (cd build && make -j7)<CR>




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => thema
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
