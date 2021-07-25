
call plug#begin('~/.vim/plugged')
Plug 'ycm-core/YouCompleteMe'
Plug '907th/vim-auto-save'
Plug 'vim-autoformat/vim-autoformat'
Plug 'ericcurtin/CurtineIncSw.vim'
Plug 'dense-analysis/ale'
Plug 'morhetz/gruvbox'
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
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

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

" run 
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>
