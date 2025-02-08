set number
set cursorline
set cursorcolumn
set smartcase
set ignorecase
set hlsearch

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'kyazdani42/nvim-web-devicons'
" statusline
Plug 'nvim-lualine/lualine.nvim'
"tabline
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
Plug 'tpope/vim-unimpaired'
Plug 'rhysd/conflict-marker.vim'
Plug 'echasnovski/mini.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'stevearc/oil.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" filesearch/grep
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
"autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'neovim/nvim-lspconfig'
function! UpdateRemotePlugins(...)
  " Needed to refresh runtime files
  let &rtp=&rtp
  UpdateRemotePlugins
endfunction

"Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

call plug#end()

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu


" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

lua << END
require('oil').setup()
require('Comment').setup()
require('mini.ai').setup()
require('mini.surround').setup()
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c","cpp","python", "lua", "rust", "vim", "vimdoc", "markdown", "markdown_inline" },
  highlight = {
    enable = true,
  }
}
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        ["<C-c>"] = false,
      },
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["q"] = "close"
      },
    }
  },
}
require('lualine').setup{
    options = {
        icons_enabled = true,
        theme  = 'ayu_dark',
    },
}
END


