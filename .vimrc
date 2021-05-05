" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

call plug#begin('~/.local/share/nvim/plugged')

" the defaults vim should have been born with
Plug 'tpope/vim-sensible'

" colorscheme
Plug 'morhetz/gruvbox'

" status bar
Plug 'itchyny/lightline.vim'
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" blazing fast fuzzy search
Plug 'junegunn/fzf.vim'
Plug '/usr/local/opt/fzf'

map <C-p> :Files<CR>
map <C-b> :Buffers<CR>
map <C-s> :Rg<CR>

" One syntax plugin to rule them all
Plug 'sheerun/vim-polyglot'

" Other languages
Plug 'jparise/vim-graphql'
Plug 'joukevandermaas/vim-ember-hbs'
Plug 'hellerve/carp-vim'


" test all the things
Plug 'jgdavey/tslime.vim'
Plug 'janko-m/vim-test'
let test#strategy = "tslime"
nmap <silent> <leader>t :TestFile<CR>
nmap <silent> <leader>T :TestNearest<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" full featured LSP client for vim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" make vim's completion like vs code
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-y>" :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" Fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

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
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'

" ctags
Plug 'ludovicchabant/vim-gutentags'

" convert code blocks to one-liners and back again
Plug 'AndrewRadev/splitjoin.vim'

" align things pretty
Plug 'junegunn/vim-easy-align'

call plug#end()

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-elixir',
  \ 'coc-ember',
  \ 'coc-eslint',
  \ 'coc-explorer',
  \ 'coc-git',
  \ 'coc-go',
  \ 'coc-highlight',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-vimlsp'
\ ]

" show line numbers
set number

" must be set outsede of vim-plug
set background=dark
colorscheme gruvbox

" persistend undo history
set undofile
set undodir^=~/.vim/tmp//,~/Library/Vim/undo

" copy to end of line
nnoremap Y y$
" copy to system clipboard
vnoremap gy "+y
" copy whole file to system clipboard
nnoremap gY gg"+yG

if has("nvim")
  " map <Esc> to exit termial-mode
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  " allow <Esc> to still close fzf
  au FileType fzf tunmap <Esc>
endif

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

map <C-e> :CocCommand explorer<CR>
