set number
set noexpandtab
set tabstop=4
set shiftwidth=4
set cursorline
set smartcase
set ignorecase
set hlsearch
set wildmenu
set hidden
" set wildmode=longest:full,full

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-commentary'
" "autocomplete
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'wellle/targets.vim'
Plug 'skywind3000/asyncrun.vim'
" Plug 'vim-scripts/AutoComplPop'

Plug 'zivyangll/git-blame.vim'
Plug 'romainl/vim-qf'

call plug#end()

" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
"
let g:conflict_marker_enable_mappings = 0
nmap ]c <Plug>(conflict-marker-next-hunk)
nmap [c <Plug>(conflict-marker-prev-hunk)
nmap ct <Plug>(conflict-marker-themselves)
nmap co <Plug>(conflict-marker-ourselves)
nmap cn <Plug>(conflict-marker-none)
nmap cb <Plug>(conflict-marker-both)
nmap cB <Plug>(conflict-marker-both-rev)

let g:surround_no_mappings = 0
nmap sd  <Plug>Dsurround
nmap sr  <Plug>Csurround
nmap cS  <Plug>CSurround
nmap sa  <Plug>Ysurround
nmap yS  <Plug>YSurround
nmap yss <Plug>Yssurround
nmap ySs <Plug>YSsurround
nmap ySS <Plug>YSsurround
xmap sa   <Plug>VSurround
xmap gS  <Plug>VgSurround

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
                                                                                                                                                                                                                                              
set background=dark    " Setting dark mode
autocmd vimenter * ++nested colorscheme gruvbox
let g:airline#extensions#tabline#enabled = 1

nnoremap <leader>fg :botright copen<CR>:AsyncRun rg -n ""<left>
" nnoremap <leader>fg :botright copen<CR>:AsyncRun grep -r -n
nnoremap <leader>fs :AsyncRun rg -n <cword><cr>:botright copen<CR>
nnoremap <leader>ff :botright copen<CR>:AsyncRun find . -name "" -printf "\%p:1:1:\%f\n"<left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left><left>
nnoremap <leader>fw :AsyncRun find . -iname "*<cword>*" -printf "\%p:1:1:\%f\n"<cr>:botright copen<cr>
" <esc>:botright copen<CR>
augroup vimrc
    autocmd QuickFixCmdPost * botright copen 8
augroup END

" map <silent><esc> :noh <CR>
map <silent><C-c> :noh <CR>:cclose<cr>
nnoremap <C-s> <C-a>
nmap <silent><leader>d :bp\|bd #<CR>

let g:qf_mapping_ack_style = 1
nmap <leader>q <Plug>(qf_qf_toggle)

nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" :match
