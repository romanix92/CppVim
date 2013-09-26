syntax on
set number
set hlsearch
set path=~/pvr8k**
set incsearch
set shiftwidth=4 softtabstop=4 tabstop=4
set expandtab
set ruler
set autoread
set autoindent
set backspace=2
set showtabline=2
set scrolloff=10
set ic
set smartcase
set smarttab
set hidden
set history=1000
set undolevels=1000
set nocp
set complete-=i
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
xnoremap p pgvy

filetype indent on

filetype plugin on

nnoremap dd "_dd
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :tab split<CR>
nnoremap <C-Down> :tabclose<CR>
nmap <F1> :mksession! ~/.vim_session <cr> " Quick write session with F2
nmap <F2> :mksession! ~/.vim_session2 <cr>
nmap <F3> :source ~/.vim_session <cr>  
nmap <F4> :source ~/.vim_session2 <cr>  
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
"Perforce
"cnoremap W ! p4 edit -c default %:p<cr>:w!<cr>
"cnoremap WQ ! p4 edit -c default %:p<cr>:w!<cr>q<cr>

"Tags
"set tags+=~/.vim/tags/irp_sw_tags
"set tags+=~/.vim/tags/irp_lib_tags
set tags+=~/.vim/tags/stl_tags
set tags+=~/.vim/tags/zodiac_tags

execute pathogen#infect()

"NERD_tree plugin
"autocmd vimenter * if !argc() | NERDTree | endif
nmap <C-n> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0

"Tlist
nmap <C-s> :TlistToggle<CR>

"OmniCpp
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_MayCompleteDot = 0 " autocomplete with .
let OmniCpp_MayCompleteArrow = 0 " autocomplete with ->
let OmniCpp_MayCompleteScope = 0 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype (i.e. parameters) in popup window

"Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1          " Put errors on left side
let g:syntastic_quiet_warnings=1        " Only errors, not warnings please
"let g:syntastic_auto_loc_list=2         " Only show errors when I ask
"let g:syntastic_disabled_filetypes = ['xml']


fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()
