if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" colorscheme
Plug 'arcticicestudio/nord-vim'

" status bar
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'nord',
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

let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'elixir': ['mix_format'],
      \   'go': ['gofmt'],
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

Plug 'AndrewRadev/splitjoin.vim'
Plug 'godlygeek/tabular'

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
Plug 'ervandew/supertab'

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

set number

" must be set outsede of vim-plug
colorscheme nord

" map <Esc> to exit termial-mode
tnoremap <Esc> <C-\><C-n>

" delete all buffers then reload the last (current) buffer
command! BO :%bd | e#
