call plug#begin('~/.vim/plugged')
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
let g:material_theme_style='darker-community'
Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-startify'
Plug 'honza/vim-snippets'
Plug 'sirver/UltiSnips'
Plug 'tpope/vim-capslock'
Plug 'AndrewRadev/tagalong.vim'
Plug 'wfxr/minimap.vim'
Plug 'kshenoy/vim-signature'
Plug 'wellle/targets.vim'
Plug 'pangloss/vim-javascript'
Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line    = 1
let g:clever_f_fix_key_direction = 1
Plug 'junegunn/vim-easy-align'
let g:lion_squeeze_spaces = 1
Plug 'a-mg/vim-wobble'
Plug 'christoomey/vim-tmux-navigator'
Plug 'Yggdroot/indentLine'
Plug 'amadeus/vim-convert-color-to'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
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

let mapleader=" "

" Makes some actions smoother (?)
set ttyfast
" minimap
let g:minimap_width = 10
nnoremap <leader>ò :MinimapToggle<cr>
let g:minimap_highlight_range = 1
let g:minimap_auto_start_win_enter = 1

set nobackup
set nowritebackup
set updatetime=300
filetype plugin indent on
syntax on

set backspace=indent,eol,start
set ruler

colorscheme material
" set termguicolors
set background=dark
let g:lightline = { 'colorscheme': 'material_vim' }

set mouse=a
set noswapfile
set hidden " Allow buffers to have changes without being displayed

nnoremap <leader>i :g//#<Left><Left>
nnoremap <leader>t :tabnew<cr>

set wildcharm=<Tab>
nnoremap <Leader><Tab> :buffer<Space><Tab>

map ZZ <nop>
map <C-z> <nop>

" set number 
set infercase " a better ignorecare

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

inoremap jk <esc>
set splitbelow
set splitright
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set cursorline
set visualbell 
set t_vb=
set nowrap
set noshowmode "hide text status bar -- insert --
set scrolloff=4

" file handling --------------------
nnoremap <leader>l <C-^>
nnoremap <leader>q :bd<cr>

" comment
nnoremap <leader>c :Commentary<cr>

" writes only if has changes
nnoremap s :update<cr>h 

" ask for confirm
set confirm 

"show commands in the end of screen
set showcmd

" netrw
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_altfile=1
nnoremap - :Explore<cr>

" visual
vnoremap < <gv
vnoremap > >gv
nnoremap vv <S-v>
nnoremap Y y$

" move lines
nnoremap <a-j> :m .+1<cr>==
nnoremap <a-k> :m .-2<cr>==
inoremap <a-j> <esc>:m .+1<cr>==gi
inoremap <a-k> <esc>:m .-2<cr>==gi
vnoremap <a-j> :m '>+1<cr>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" numbers keybindings
nnoremap <silent> <leader>0 :tabnew $MYVIMRC<CR>
" nnoremap <leader>9 :%bd|e#|#bd<cr>  

" Automatically source vimrc on save.
autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC 

" NERDTree 
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
"
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

" nnoremap <leader>g :call JumpToCSS()<CR>

set cot=menu,menuone

ino <BS> <BS><C-r>=getline('.')[col('.')-3:col('.')-2]=~#'\k\k'?!pumvisible()?"\<lt>C-n>\<lt>C-p>":'':pumvisible()?"\<lt>C-y>":''<CR>
ino <CR> <C-r>=pumvisible()?"\<lt>C-y>":""<CR><CR>
ino <Tab> <C-r>=pumvisible()?"\<lt>C-n>":"\<lt>Tab>"<CR>
ino <S-Tab> <C-r>=pumvisible()?"\<lt>C-p>":"\<lt>S-Tab>"<CR>

augroup MyAutoComplete 
  au!
  au InsertCharPre * if
        \ !exists('s:complete') &&
        \ !pumvisible() &&
        \ getline('.')[col('.')-2].v:char =~# '\k\k' |
        \ let s:complete = 1 |
        \ noautocmd call feedkeys("\<C-n>\<C-p>", "nt") |
        \ endif
  au CompleteDone * if exists('s:complete') | unlet s:complete | endif
augroup END

" save buffer window position
autocmd! BufWinLeave * let b:winview = winsaveview()
autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview

