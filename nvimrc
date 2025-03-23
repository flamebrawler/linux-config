set number
set cursorline
set cursorcolumn
set smartcase
set ignorecase
set hlsearch

call plug#begin()

Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'kyazdani42/nvim-web-devicons'

" statusline
Plug 'nvim-lualine/lualine.nvim'
"tabline
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'romgrk/barbar.nvim'
" Plug 'rhysd/conflict-marker.vim'
Plug 'akinsho/git-conflict.nvim'

" quickfix
Plug 'yorickpeterse/nvim-pqf'
Plug 'romainl/vim-qf'

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
Plug 'sudormrfbin/cheatsheet.nvim'
Plug 'famiu/bufdelete.nvim'
Plug 'nosduco/remote-sshfs.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'preservim/tagbar'
"
" motions
Plug 'hadronized/hop.nvim'
Plug 'ggandor/leap.nvim'

" textobjects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'kylechui/nvim-surround'
Plug 'brenoprata10/nvim-highlight-colors'
Plug 'azabiong/vim-highlighter'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

Plug 'rcarriga/nvim-notify'
Plug 'chentoast/marks.nvim'

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

call plug#end()
vnoremap p "_dP

set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
colorscheme kanagawa

" nmap <leader>t :TagbarToggle<CR>


map <silent><esc> :noh <CR>
map <silent><C-c> :noh <CR>
nnoremap <C-s> <C-a>

nnoremap <leader>ff :lua require('telescope.builtin').find_files({ no_ignore = true })<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fn <cmd>Telescope oldfiles<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

nnoremap <leader>d :Bd<cr>


let g:qf_mapping_ack_style = 1
nmap <leader>q <Plug>(qf_qf_toggle)


"let g:coq_settings = { 'auto_start': v:true }
"let g:coq_settings = { 'auto_start': 'shut-up' }
" nmap <silent><space> :HopChar2MW<CR>


nnoremap <silent> <Leader>l ml:execute 'match Search /\%'.line('.').'l/'<CR>
" :match

" tabline bindings
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>

" Pin/unpin buffer
nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Goto pinned/unpinned buffer
"                          :BufferGotoPinned
"                          :BufferGotoUnpinned

" Close buffer
nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
nnoremap <silent>    <leader>d <Cmd>BufferClose<CR>
" Restore buffer
nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p> <Cmd>BufferPick<CR>
nnoremap <silent> <C-s-p> <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>


autocmd VimEnter * execute("Neotree show")

lua << END

local select_one_or_multi = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local multi = picker:get_multi_selection()
  if not vim.tbl_isempty(multi) then
    require('telescope.actions').close(prompt_bufnr)
    for _, j in pairs(multi) do
        if j.path ~= nil then
            if j.lnum ~= nil then
                -- vim.cmd(string.format("%s %s:%s", "edit", j.path, j.lnum))
                vim.cmd(string.format("%s +%s %s", "edit", j.lnum, j.path))
                -- vim.cmd(string.format("%s %s", "edit", j.path))
            else
                vim.cmd(string.format("%s %s", "edit", j.path))
            end
        end
    end
  else
    require('telescope.actions').select_default(prompt_bufnr)
  end
end
-- require('lspconfig').clangd.setup{}
local wilder = require('wilder')
wilder.setup({
    modes = {':','/','?'},
    next_key= '<tab>',
    -- next_key= '<c-j>',
    -- previous_key= '<C-k>',
    previous_key= '<s-tab>',
    accept_key= '<C-l>',
    reject_key= '<C-h>'
})
--vim.keymap.set('c', '<tab>', wilder.in_context() ? wilder.next() : '<tab>')
wilder.set_option('pipeline', {
  wilder.branch(
    wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'python',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 1,
    }),
    wilder.python_search_pipeline({
      -- can be set to wilder#python_fuzzy_delimiter_pattern() for stricter fuzzy matching
      pattern = wilder.python_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      sorter = wilder.python_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#python_search() for more details
      engine = 're',
    })
  ),
})
wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- -- 'single', 'double', 'rounded' or 'solid'
    -- -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
    highlighter = wilder.basic_highlighter(),
    -- max_width = '20%', -- minimum height of the popupmenu, can also be a number
    max_height = '20%', -- to set a fixed height, set max_height to the same value
  })
))
require("ibl").setup()
require('oil').setup()
require('Comment').setup()
require('mini.ai').setup()
-- require('mini.surround').setup()
require("nvim-surround").setup()
require("notify")
vim.notify = require("notify")
-- require('mini.cursorword').setup()
-- require('mini.indentscope').setup{
--     draw= {
--         delay=0,
-- animation=require('mini.indentscope').gen_animation.none()
--     }
-- }
vim.api.nvim_set_hl(0, 'DiffText', { bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { bg = "#1d3450" })
require('git-conflict').setup{
  default_mappings = true, -- disable buffer local mapping created by this plugin
  default_commands = true, -- disable commands created by this plugin
  disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
  list_opener = 'copen', -- command or function to open the conflicts list
  highlights = { -- They must have background color, otherwise the default color will be used
    incoming = 'DiffAdd',
    current = 'DiffText',
  }
}
vim.api.nvim_create_autocmd('User', {
  pattern = 'GitConflictDetected',
  nested = true,
  callback = function()
      vim.schedule(function()
      vim.notify('Conflict detected')
      vim.cmd [[:GitConflictListQf]]
      -- vim.cmd [[:GitConflictNextConflict]]
    end)
  end
})

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = { "c","cpp","python", "lua", "rust", "vim", "vimdoc", "bash", "markdown", "markdown_inline" },
  highlight = {
    enable = true,
  }
}
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    -- vimgrep_arguments = {
    --     'rg', '--ignore', '--hidden', '--no-ignore-vcs', '--vimgrep', '-g', '*.{c,h,py,cxx,hxx,txt,md,json}'
    -- },
    mappings = {
      i = {
        ["<C-c>"] = false,
        ["<C-J>"] = require('telescope.actions').move_selection_next,
        ["<C-K>"] = require('telescope.actions').move_selection_previous,
        ["<TAB>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_next,
        ["<S-TAB>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_previous,
        ["<CR>"] = select_one_or_multi,
        ["<C-DOWN>"] = require('telescope.actions').cycle_history_next,
        ["<C-UP>"] = require('telescope.actions').cycle_history_prev,
      },
      n = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-J>"] = require('telescope.actions').move_selection_next,
        ["<C-K>"] = require('telescope.actions').move_selection_previous,
        ["<TAB>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_next,
        ["<S-TAB>"] = require('telescope.actions').toggle_selection + require('telescope.actions').move_selection_previous,
        ["<CR>"] = select_one_or_multi,
        ["<C-DOWN>"] = require('telescope.actions').cycle_history_next,
        ["<C-UP>"] = require('telescope.actions').cycle_history_prev,
        ["q"] = "close"
      },
    }
  },
}
require('telescope').load_extension 'remote-sshfs'
require('remote-sshfs').setup()
require'hop'.setup()
require('leap').setup{}
vim.keymap.set({'n', 'x', 'o'}, ' ',  '<Plug>(leap)')
-- vim.keymap.set({'n', 'x', 'o'}, 'M', '<Plug>(leap-backward)')
-- vim.keymap.set({'n', 'x', 'o'}, 'gs', '<Plug>(leap-from-window)')

require('lualine').setup{
    options = {
        icons_enabled = true,
        theme  = 'auto',
    },
  sections = {
      lualine_c = {
          {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = false,  -- Display new file status (new file means no write after created)
          path = 1,
          }
      }
  }
}
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ad"] = "@function.outer",
        ["id"] = "@function.inner",
        ["an"] = "@block.outer",
        ["in"] = "@block.inner",
        ["ac"] = "@class.outer",
        -- You can optionally set descriptions to the mappings (used in the desc parameter of
        -- nvim_buf_set_keymap) which plugins like which-key display
        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
        -- You can also use captures from other query groups like `locals.scm`
        ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
      },
      -- You can choose the select mode (default is charwise 'v')
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * method: eg 'v' or 'o'
      -- and should return the mode ('v', 'V', or '<c-v>') or a table
      -- mapping query_strings to modes.
      selection_modes = {
        ['@parameter.outer'] = 'v', -- charwise
        ['@function.outer'] = 'V', -- linewise
        ['@class.outer'] = '<c-v>', -- blockwise
      },
      -- If you set this to `true` (default is `false`) then any textobject is
      -- extended to include preceding or succeeding whitespace. Succeeding
      -- whitespace has priority in order to act similarly to eg the built-in
      -- `ap`.
      --
      -- Can also be a function which gets passed a table with the keys
      -- * query_string: eg '@function.inner'
      -- * selection_mode: eg 'v'
      -- and should return true or false
      include_surrounding_whitespace = false,
    },
  },
}
require('pqf').setup()
vim.opt.termguicolors = true

require('nvim-highlight-colors').setup({})
require('marks').setup()
require("neo-tree").setup({
    filesystem = {
        window = {
            mappings = {
                -- disable fuzzy finder
                ["/"] = "noop"
            }
        }
    },
    source_selector = {
        winbar = true,
        statusline = false
    }
})
END

