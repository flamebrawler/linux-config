set number
set cursorline
" set cursorcolumn
set smartcase
set ignorecase
set hlsearch

call plug#begin()

function! UpdateRemotePlugins(...)
    " Needed to refresh runtime files
    let &rtp=&rtp
    UpdateRemotePlugins
endfunction

" Style
Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'rebelot/kanagawa.nvim'
Plug 'sainnhe/sonokai'
Plug 'morhetz/gruvbox'
Plug 'folke/tokyonight.nvim'
Plug 'navarasu/onedark.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'romgrk/barbar.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'rcarriga/nvim-notify'
Plug 'akinsho/bufferline.nvim'


"keybinds
Plug 'kylechui/nvim-surround'
Plug 'famiu/bufdelete.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'azabiong/vim-highlighter'
" text object
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
" motions
Plug 'hadronized/hop.nvim'
Plug 'ggandor/leap.nvim'

" clarity
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'chentoast/marks.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'folke/twilight.nvim'


Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'akinsho/git-conflict.nvim'

" quickfix
" Plug 'yorickpeterse/nvim-pqf'
" Plug 'romainl/vim-qf'
Plug 'kevinhwang91/nvim-bqf'

" separate tools
Plug 'stevearc/oil.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'
" Plug 'nvim-tree/nvim-tree.lua'
Plug 'stevearc/aerial.nvim'
"autocomplete
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

Plug 'echasnovski/mini.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-context'
" filesearch/grep
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }

Plug 'neovim/nvim-lspconfig'
Plug 'nosduco/remote-sshfs.nvim'
" Plug 'preservim/tagbar'

Plug 'brenoprata10/nvim-highlight-colors'
Plug 'goolord/alpha-nvim'
Plug 'rmagatti/auto-session'
Plug 'UtkarshVerma/molokai.nvim'


Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
Plug 'nvim-pack/nvim-spectre'
" Plug 'folke/trouble.nvim'
" Plug 'L3MON4D3/LuaSnip'

Plug 'windwp/nvim-autopairs'

call plug#end()
" vnoremap p "_dP
let g:onedark_config = {
    \ 'style': 'darker',
\}



set termguicolors     " enable true colors support
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
" kanagawa
" colorscheme kanagawa-wave
colorscheme tokyonight-night
" colorscheme onedark

" nmap <leader>t :TagbarToggle<CR>

" nnoremap <C-p> :FuzzyOpen<CR>
map <silent><esc> :noh <CR>
map <silent><C-c> :noh <CR>
nnoremap <C-s> <C-a>
"
" Find files using Telescope command-line sugar.
nnoremap <silent>    [b <Cmd>BufferLinePrevious<CR>
nnoremap <silent>    ]b <Cmd>BufferLineNext<CR>

nnoremap <leader>ff :lua require('telescope.builtin').find_files({ no_ignore = true })<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fn <cmd>Telescope oldfiles<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

nnoremap <leader>d :Bd<cr>
nnoremap <leader>t :Twilight<cr>
nnoremap <leader>gl :Gitsigns blame_line<cr>
nnoremap <leader>gg :Gitsigns blame<cr>
command! MarksQFListAllCustom exe "lua require'marks'.mark_state:all_to_list('quickfixlist')" | botright copen
nnoremap <leader>m :MarksQFListAllCustom<cr>

nnoremap <silent> <c-p> :BufferLinePick<CR>
nnoremap <silent><a-,> :BufferLineCyclePrev<CR>
nnoremap <silent><a-.> :BufferLineCycleNext<CR>
nnoremap <silent><a->> :BufferLineMoveNext<CR>
nnoremap <silent><a-<> :BufferLineMovePrev<CR>
nnoremap <silent><C-l> <c-6>

nmap <leader>q :cclose<CR>


" let g:conflict_marker_enable_mappings = 0
" nmap ]c <Plug>(conflict-marker-next-hunk)
" nmap [c <Plug>(conflict-marker-prev-hunk)
" nmap ct <Plug>(conflict-marker-themselves)
" nmap co <Plug>(conflict-marker-ourselves)
" nmap cn <Plug>(conflict-marker-none)
" nmap cb <Plug>(conflict-marker-both)
" nmap cB <Plug>(conflict-marker-both-rev)

let g:coq_settings = { 'auto_start': v:true }
let g:coq_settings = { 'auto_start': 'shut-up' }
" nmap <silent><space> :HopChar2MW<CR>


" tabline bindings
" nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
" nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
" nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
" nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
" nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
" nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
" nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
" nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
" nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
" nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
" nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
" nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
" nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
" nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
"
" Pin/unpin buffer
" nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>

" Close buffer
" nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
" nnoremap <silent>    <leader>d <Cmd>BufferClose<CR>
" Restore buffer
" nnoremap <silent>    <A-s-c> <Cmd>BufferRestore<CR>

" Magic buffer-picking mode
" nnoremap <silent> <C-p> <Cmd>BufferPick<CR>
" nnoremap <silent> <C-s-p> <Cmd>BufferPickDelete<CR>

" Sort automatically by...
" nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
" nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
" nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
" nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
" nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
autocmd bufenter * if (winnr("$") == 1 && &filetype == "neo-tree") | q | endif


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
    -- can use python instead of vim if available
    wilder.cmdline_pipeline({
      -- sets the language to use, 'vim' and 'python' are supported
      language = 'vim',
      -- 0 turns off fuzzy matching
      -- 1 turns on fuzzy matching
      -- 2 partial fuzzy matching (match does not have to begin with the same first letter)
      fuzzy = 1,
    }),
    wilder.vim_search_pipeline({
      -- can be set to wilder#vim_fuzzy_delimiter_pattern() for stricter fuzzy matching
      -- pattern = wilder.vim_fuzzy_pattern(),
      -- omit to get results in the order they appear in the buffer
      -- sorter = wilder.vim_difflib_sorter(),
      -- can be set to 're2' for performance, requires pyre2 to be installed
      -- see :h wilder#vim_search() for more details
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
require('mini.operators').setup()
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
    vimgrep_arguments = {
        'rg', '--ignore', '--hidden', '--no-ignore-vcs', '--vimgrep'--[[ , '-g', '*.{c,h,py,cxx,hxx,txt,md,json}' ]]
    },
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
      lualine_b = {'branch', 'diff', 'diagnostics'},
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
        ["il"] = "@call.inner",
        ["al"] = "@call.outer",
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
-- require('pqf').setup()
require('bqf').setup()
-- vim.opt.termguicolors = true

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
    }
})
require("twilight").setup({
    dimming = {
        inactive = true,
    },
    context = 15,
})
require('gitsigns').setup()
require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})
-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
vim.keymap.set("n", "<leader>n", "<cmd>Neotree show toggle<CR>")
require("bufferline").setup{
    options = {
        separator_style = "slant",
        offsets = {
            filetype = "neo-tree filesystem",
            text = "File explorer",
            text_align = "left" ,
            separator = true
        }
    }
}
local groups = require('bufferline.groups')
groups = {
    options = {
      toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
    },
    items = {
      {
        name = "Tests", -- Mandatory
        highlight = {underline = true, sp = "blue"}, -- Optional
        priority = 2, -- determines where it will appear relative to other groups (Optional)
        icon = " ", -- Optional
        matcher = function(buf) -- Mandatory
          return buf.filename:match('%test%')
        end,
      },
      {
        name = "Docs",
        highlight = {undercurl = true, sp = "green"},
        auto_close = false,  -- whether or not close this group if it doesn't contain the current buffer
        matcher = function(buf)
          return buf.filename:match('%.md') or buf.filename:match('%.txt')
        end,
        separator = { -- Optional
          style = require('bufferline.groups').separator.tab
        },
      }
    }
}
-- require("nvim-tree").setup()
-- require('dashboard').setup{}
local startify = require("alpha.themes.startify")
-- available: devicons, mini, default is mini
-- if provider not loaded and enabled is true, it will try to use another provider
startify.file_icons.provider = "devicons"
require("alpha").setup(
    startify.config
)
require("auto-session").setup()
-- vim.cmd [[autocmd VimEnter * ]]
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    --   vim.schedule(function()
    -- end)
      -- vim.cmd [[execute("Neotree show")]]
  end
})

require('spectre').setup()
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search on current file"
})
require("nvim-autopairs").setup {}

END

