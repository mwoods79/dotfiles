if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" git
Plug 'tpope/vim-git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'airblade/vim-gitgutter'

Plug 'AndrewRadev/splitjoin.vim'
Plug 'jbranchaud/vim-bdubs'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'jgdavey/tslime.vim'
Plug 'jgdavey/vim-turbux'
Plug 'kchmck/vim-coffee-script'
Plug 'leshill/vim-json'
Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'rondale-sc/vim-spacejam'
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
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
Plug 'vim-ruby/vim-ruby'
Plug 'jlanzarotta/bufexplorer'
Plug 'wgibbs/vim-irblack'
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'exu/pgsql.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'sbdchd/neoformat'
Plug 'hashrocket/vim-hashrocket'

Plug 'avdgaag/vim-phoenix'
" erlang
Plug 'altercation/vim-colors-solarized'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'neomake/neomake'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

Plug 'slashmili/alchemist.vim'
Plug 'junegunn/fzf.vim'


" Haskell
Plug 'neovimhaskell/haskell-vim'
" plug 'alx741/vim-hindent'
Plug 'jaspervdj/stylish-haskell'
Plug 'parsonsmatt/intero-neovim'

call plug#end()

set number

colorscheme solarized
set background=dark

" map <Esc> to exit termial-mode
:tnoremap <Esc> <C-\><C-n>
