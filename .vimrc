call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_theme_style='darker-community'
Plug 'mhinz/vim-startify'
Plug 'wellle/targets.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
Plug 'tommcdo/vim-lion' "easy align maybe is better
let g:lion_squeeze_spaces = 1
Plug 'a-mg/vim-wobble'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'ap/vim-css-color'
Plug 'amadeus/vim-convert-color-to'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'nelsyeung/twig.vim'
Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'psliwka/vim-smoothie'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
call plug#end()

filetype plugin indent on
syntax on

set backspace=indent,eol,start
set ruler

colorscheme material
set termguicolors
" let g:gruvbox_invert_selection=0
" let g:gruvbox_bold=0
set background=dark
let g:lightline = { 'colorscheme': 'material_vim' }


let mapleader=" "
set mouse=a
set noswapfile
set hidden " Allow buffers to have changes without being displayed

nnoremap <leader>i :g//#<Left><Left>

set wildcharm=<Tab>
nnoremap <Leader><Tab> :buffer<Space><Tab>

map ZZ <nop>
map <C-z> <nop>
set number 
set infercase " a better ignorecare

set formatoptions-=cro " remove comment in new line

inoremap jk <esc>
xnoremap <space> <esc>
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set cursorline
set visualbell t_vb=
set nowrap
set noshowmode "hide text status bar -- insert --
set scrolloff=5

" file movement
nnoremap <leader>l <C-^>

" save file
nnoremap <leader>s :update<cr>

" netrw
let g:netrw_liststyle=3
let g:netrw_browse_split=2

" visual
vnoremap < <gv
vnoremap > >gv

" move lines
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" edit vimrc
nnoremap <silent> <leader>0 :tabnew $MYVIMRC<CR>

" Automatically source vimrc on save.
autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC 

" open terminal
nnoremap <leader>t :term<CR>
set termwinsize=10x0

" NERDTree 
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <leader>j :NERDTreeToggle<CR>
nnoremap <silent> <Leader>f :NERDTreeFind<CR>
nnoremap <silent> <Leader>n :NERDTree<CR>
autocmd FileType nerdtree set norelativenumber

" FZF
nnoremap <leader>p :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'cat {}']}, <bang>0)

function! JumpToCSS()
    let id_pos = searchpos("id", "nb", line('.'))[1]
    let class_pos = searchpos("class", "nb", line('.'))[1]

    if class_pos > 0 || id_pos > 0
      if class_pos < id_pos
        execute ":vim '#".expand('<cword>')."' **/*.css"
      elseif class_pos > id_pos
        execute ":vim '.".expand('<cword>')."' **/*.css"
      endif
    endif
  endfunction

nnoremap <leader>g :call JumpToCSS()<CR>

