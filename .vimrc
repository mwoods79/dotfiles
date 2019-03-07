" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" colorscheme
Plug 'altercation/vim-colors-solarized'

" status bar
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" most essential plugin
Plug 'jlanzarotta/bufexplorer'

" blazing fast fuzzy search
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-s> :Rg<CR>

" quickly find in files
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --vimgrep --no-heading'

" realtime feedback
Plug 'w0rp/ale'

let g:ale_linters = {
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint', 'tsserver'],
      \}
let g:ale_fixers = {
      \  '*': ['remove_trailing_lines', 'trim_whitespace'],
      \  'elixir': ['mix_format'],
      \  'go': ['gofmt'],
      \  'ruby': ['rubocop'],
      \  'javascript': ['eslint'],
      \  'typescript': ['eslint'],
      \}
let g:ale_fix_on_save = 1

" One syntax plugin to rule them all
Plug 'sheerun/vim-polyglot'

" test all the things
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
let test#strategy = "tslime"
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

" all the other tpope things
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" autocompletion
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}

inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~ '\s'
" endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" convert code blocks to one-liners and back again
Plug 'AndrewRadev/splitjoin.vim'

" align things pretty
Plug 'junegunn/vim-easy-align'

"ruby
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'

" Elixir
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'

" Haskell
" plug 'alx741/vim-hindent'
Plug 'jaspervdj/stylish-haskell'
Plug 'parsonsmatt/intero-neovim'

call plug#end()

" show line numbers
set number

" must be set outsede of vim-plug
set background=dark
colorscheme solarized

" persistend undo history
set undofile
set undodir^=~/.vim/tmp//,~/Library/Vim/undo

" copy to end of line
nnoremap Y y$
" copy to system clipboard
vnoremap gy "+y
" copy whole file to system clipboard
nnoremap gY gg"+yG

" map <Esc> to exit termial-mode
tnoremap <Esc> <C-\><C-n>

" quickly edit this file and source it
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>

" delete all buffers then reload the last (current) buffer
command! BO :%bd | e#
command! JQ :%!jq '.'

augroup Misc
  autocmd!
  " Only create a swap file when the file is modified
  autocmd CursorHold,BufWritePost,BufReadPost,BufLeave *
        \ if !$VIMSWAP && isdirectory(expand("<amatch>:h")) | let &swapfile = &modified | endif

  " Use q to quit help buffers
  autocmd FileType help nnoremap <buffer> q :q<cr>
augroup END
