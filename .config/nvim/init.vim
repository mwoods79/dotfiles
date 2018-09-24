if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" colorscheme
Plug 'altercation/vim-colors-solarized'
Plug 'arcticicestudio/nord-vim'

" status bar
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }

" realtime feedback
Plug 'w0rp/ale'

" blazing fast fuzzy search
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

map <C-p> :Files<CR>
map <C-t> :Buffers<CR>
map <C-s> :Rg<CR>

command! -bang -nargs=* Rg
      \ call fzf#vim#grep(
      \   'rg --column --line-number --no-heading --color=always --ignore-case '.shellescape(<q-args>), 1,
      \   <bang>0 ? fzf#vim#with_preview('up:60%')
      \           : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0)

" quickly find in files
Plug 'mileszs/ack.vim'
let g:ackprg = 'rg --vimgrep --no-heading'

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
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'exu/pgsql.vim'
Plug 'sbdchd/neoformat'
Plug 'hashrocket/vim-hashrocket'

" javascript
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'avdgaag/vim-phoenix'
Plug 'slashmili/alchemist.vim'

Plug 'ludovicchabant/vim-gutentags'

" Haskell
Plug 'neovimhaskell/haskell-vim'
" plug 'alx741/vim-hindent'
Plug 'jaspervdj/stylish-haskell'
Plug 'parsonsmatt/intero-neovim'

call plug#end()

set number

colorscheme nord
" set background=dark

" map <Esc> to exit termial-mode
:tnoremap <Esc> <C-\><C-n>
