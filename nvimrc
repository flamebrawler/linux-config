set noexpandtab
set tabstop=4
set shiftwidth=4
set number
set cursorline
set cursorcolumn
set smartcase
set ignorecase
set hlsearch

" nvim specific
call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'kyazdani42/nvim-web-devicons' " statusline
Plug 'nvim-lualine/lualine.nvim' "tabline
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
"Plug 'Shougo/denite.nvim' " requires python nvim
call plug#end()

set termguicolors " enable true colors support
let ayucolor="light" " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark" " for dark version of theme
colorscheme ayu

lua << END
require('lualine').setup()
END

