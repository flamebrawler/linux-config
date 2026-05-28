-- ============================================================
-- OPTIONS
-- ============================================================
vim.opt.number        = true
vim.opt.cursorline    = true
vim.opt.smartcase     = true
vim.opt.ignorecase    = true
vim.opt.hlsearch      = true
vim.opt.termguicolors = true

-- ============================================================
-- KEYMAPS (non-plugin)
-- ============================================================
vim.keymap.set({ 'n' }, '<Esc>',  ':noh<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<C-c>',  ':noh<CR>', { silent = true })
vim.keymap.set({ 'n' }, '<C-s>',  '<C-a>')
vim.keymap.set({ 'n' }, '<C-l>',  '<C-6>',   { silent = true })
vim.keymap.set({ 'n' }, '<leader>q', ':cclose<CR>')

-- ============================================================
-- BOOTSTRAP lazy.nvim
-- ============================================================
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git', 'clone', '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- ============================================================
-- PLUGINS
-- ============================================================
require('lazy').setup({

  -- ----------------------------------------------------------
  -- Colorschemes
  -- ----------------------------------------------------------
  { 'ayu-theme/ayu-vim' },
  { 'rebelot/kanagawa.nvim' },
  { 'sainnhe/sonokai' },
  { 'morhetz/gruvbox' },
  { 'navarasu/onedark.nvim',
    config = function()
      vim.g.onedark_config = { style = 'darker' }
    end,
  },
  { 'UtkarshVerma/molokai.nvim' },
  { 'folke/tokyonight.nvim',
    lazy = false, priority = 1000,
    config = function()
      vim.cmd.colorscheme('tokyonight-night')
    end,
  },

  -- ----------------------------------------------------------
  -- UI
  -- ----------------------------------------------------------
  { 'kyazdani42/nvim-web-devicons', lazy = true },

  { 'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local function sshfs_connected()
        local ok, conns = pcall(require, 'remote-sshfs.connections')
        if ok and conns.is_connected() then
          return 'SSH: ' .. conns.get_current_host()['Name']
        end
        return 'SSH: Not connected'
      end
      require('lualine').setup{
        options = { icons_enabled = true, theme = 'auto' },
        sections = {
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {{
            'filename', file_status = true,
            newfile_status = false, path = 1,
          }},
          lualine_y = { sshfs_connected },
        },
      }
    end,
  },

  { 'rcarriga/nvim-notify',
    config = function()
      require('notify')
      vim.notify = require('notify')
    end,
  },

  { 'akinsho/bufferline.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      require('bufferline').setup{
        options = {
          separator_style = 'slant',
          offsets = {{
            filetype   = 'neo-tree filesystem',
            text       = 'File explorer',
            text_align = 'left',
            separator  = true,
          }},
        },
      }
      local map = vim.keymap.set
      map('n', '<c-p>', ':BufferLinePick<CR>',          { silent = true })
      map('n', '<a-,>', ':BufferLineCyclePrev<CR>',     { silent = true })
      map('n', '<a-.>', ':BufferLineCycleNext<CR>',     { silent = true })
      map('n', '<a->>', ':BufferLineMoveNext<CR>',      { silent = true })
      map('n', '<a-<>', ':BufferLineMovePrev<CR>',      { silent = true })
    end,
  },

  { 'goolord/alpha-nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons' },
    config = function()
      local startify = require('alpha.themes.startify')
      startify.file_icons.provider = 'devicons'
      require('alpha').setup(startify.config)
    end,
  },

  -- ----------------------------------------------------------
  -- Keybinds / editing
  -- ----------------------------------------------------------
  { 'kylechui/nvim-surround',   config = true },
  { 'famiu/bufdelete.nvim',
    config = function()
      vim.keymap.set('n', '<leader>d', ':Bd<CR>')
    end,
  },
  { 'numToStr/Comment.nvim',    config = true },
  { 'azabiong/vim-highlighter' },
  { 'kana/vim-textobj-user' },
  { 'kana/vim-textobj-entire', dependencies = { 'kana/vim-textobj-user' } },
  { 'windwp/nvim-autopairs',    config = true },

  -- ----------------------------------------------------------
  -- Motions
  -- ----------------------------------------------------------
  { 'hadronized/hop.nvim',
    config = function()
      require('hop').setup()
    end,
  },
  { 
    url= 'https://codeberg.org/andyg/leap.nvim',
    config = function()
      require('leap').setup{}
      vim.keymap.set({'n','x','o'}, ' ', '<Plug>(leap)')
    end,
  },

  -- ----------------------------------------------------------
  -- Clarity / display
  -- ----------------------------------------------------------
  { 'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function() require('ibl').setup() end,
  },
  { 'chentoast/marks.nvim',
    config = function()
      require('marks').setup()
      vim.api.nvim_create_user_command('MarksQFListAllCustom', function()
        vim.cmd("lua require'marks'.mark_state:all_to_list('quickfixlist')")
        vim.cmd('botright copen')
      end, {})
      vim.keymap.set('n', '<leader>m', ':MarksQFListAllCustom<CR>')
    end,
  },
  { 'sheerun/vim-polyglot' },
  { 'folke/twilight.nvim',
    config = function()
      require('twilight').setup({ dimming = { inactive = true }, context = 15 })
      vim.keymap.set('n', '<leader>t', ':Twilight<CR>')
    end,
  },
  { 'brenoprata10/nvim-highlight-colors',
    config = function() require('nvim-highlight-colors').setup({}) end,
  },

  -- ----------------------------------------------------------
  -- Git
  -- ----------------------------------------------------------
  { 'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
      vim.keymap.set('n', '<leader>gl', ':Gitsigns blame_line<CR>')
      vim.keymap.set('n', '<leader>gg', ':Gitsigns blame<CR>')
      require("scrollbar.handlers.gitsigns").setup()
    end,
  },
  { 'akinsho/git-conflict.nvim',
    config = function()
      vim.api.nvim_set_hl(0, 'DiffText', { bg = '#1d3b40' })
      vim.api.nvim_set_hl(0, 'DiffAdd',  { bg = '#1d3450' })
      require('git-conflict').setup{
        default_mappings    = true,
        default_commands    = true,
        disable_diagnostics = false,
        list_opener         = 'copen',
        highlights          = { incoming = 'DiffAdd', current = 'DiffText' },
      }
      vim.api.nvim_create_autocmd('User', {
        pattern  = 'GitConflictDetected',
        nested   = true,
        callback = function()
          vim.schedule(function()
            vim.notify('Conflict detected')
            vim.cmd(':GitConflictListQf')
          end)
        end,
      })
    end,
  },

  -- ----------------------------------------------------------
  -- Quickfix
  -- ----------------------------------------------------------
  { 'kevinhwang91/nvim-bqf',
    config = function() require('bqf').setup() end,
  },

  -- ----------------------------------------------------------
  -- File / project navigation
  -- ----------------------------------------------------------
  { 'stevearc/oil.nvim',
    config = function() require('oil').setup() end,
  },
  { 'MunifTanjim/nui.nvim', lazy = true },
  { 'nvim-neo-tree/neo-tree.nvim',
    dependencies = { 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons', 'MunifTanjim/nui.nvim' },
    config = function()
      require('neo-tree').setup({
        filesystem = { window = { mappings = { ['/'] = 'noop' } } },
      })
      vim.keymap.set('n', '<leader>n', ':Neotree show toggle<CR>')
      vim.api.nvim_create_autocmd('BufEnter', {
        callback = function()
          if vim.fn.winnr('$') == 1 and vim.bo.filetype == 'neo-tree' then
            vim.cmd('q')
          end
        end,
      })
    end,
  },
  -- { 'stevearc/aerial.nvim',
  --   config = function()
  --     require('aerial').setup({
  --       on_attach = function(bufnr)
  --         vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
  --         vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
  --       end,
  --     })
  --     vim.keymap.set('n', '<leader>a', '<cmd>AerialToggle!<CR>')
  --   end,
  -- },

  -- ----------------------------------------------------------
  -- Autocomplete
  -- ----------------------------------------------------------
--  { 'ms-jpq/coq_nvim',      branch = 'coq' },
--  { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
--  { 'ms-jpq/coq.thirdparty', branch = '3p',
--    config = function()
--      vim.g.coq_settings = { auto_start = 'shut-up' }
--    end,
--  },

  -- ----------------------------------------------------------
  -- mini.nvim
  -- ----------------------------------------------------------
  { 'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.operators').setup()
    end,
  },

  -- ----------------------------------------------------------
  -- Treesitter
  -- ----------------------------------------------------------
  { 'nvim-treesitter/nvim-treesitter',
    lazy = false,
    tag = "v0.10.0",
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').setup{
        ensure_installed = {
          'c','cpp','python','lua','rust','vim','vimdoc','bash','markdown','markdown_inline'
        },
        highlight = { enable = true },
        textobjects = {
          select = {
            enable    = true,
            lookahead = true,
            keymaps = {
              ['ad'] = '@function.outer',
              ['id'] = '@function.inner',
              ['an'] = '@block.outer',
              ['in'] = '@block.inner',
              ['ac'] = '@class.outer',
              ['il'] = '@call.inner',
              ['al'] = '@call.outer',
              ['ic'] = { query = '@class.inner',    desc = 'Select inner part of a class region' },
              ['as'] = { query = '@local.scope',    query_group = 'locals', desc = 'Select language scope' },
            },
            selection_modes = {
              ['@parameter.outer'] = 'v',
              ['@function.outer']  = 'V',
              ['@class.outer']     = '<c-v>',
            },
            include_surrounding_whitespace = false,
          },
        },
      }
    end,
  },
  { 'nvim-treesitter/nvim-treesitter-textobjects',
    lazy=false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
  { 'nvim-treesitter/nvim-treesitter-context',
    lazy = false,
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  -- ----------------------------------------------------------
  -- Telescope
  -- ----------------------------------------------------------
  { 'nvim-lua/plenary.nvim', lazy = true },
  { 'nvim-telescope/telescope.nvim',
    tag          = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nosduco/remote-sshfs.nvim',
    },
    config = function()
      local actions = require('telescope.actions')

      local select_one_or_multi = function(prompt_bufnr)
        local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
        local multi  = picker:get_multi_selection()
        if not vim.tbl_isempty(multi) then
          actions.close(prompt_bufnr)
          for _, j in pairs(multi) do
            if j.path ~= nil then
              if j.lnum ~= nil then
                vim.cmd(string.format('%s +%s %s', 'edit', j.lnum, j.path))
              else
                vim.cmd(string.format('%s %s', 'edit', j.path))
              end
            end
          end
        else
          actions.select_default(prompt_bufnr)
        end
      end

      local shared_mappings = {
        ['<C-J>']     = actions.move_selection_next,
        ['<C-K>']     = actions.move_selection_previous,
        ['<TAB>']     = actions.toggle_selection + actions.move_selection_next,
        ['<S-TAB>']   = actions.toggle_selection + actions.move_selection_previous,
        ['<CR>']      = select_one_or_multi,
        ['<C-DOWN>']  = actions.cycle_history_next,
        ['<C-UP>']    = actions.cycle_history_prev,
      }

      require('telescope').setup{
        defaults = {
          vimgrep_arguments = {
            'rg','--ignore','--hidden','--no-ignore-vcs','--vimgrep'
          },
          mappings = {
            i = vim.tbl_extend('force', { ['<C-c>'] = false }, shared_mappings),
            n = vim.tbl_extend('force', { ['q'] = 'close' },   shared_mappings),
          },
        },
        extensions = {
          live_grep_args = {
            auto_quoting = true,
            mappings = {
              i = {
                ['<C-f>']     = require('telescope-live-grep-args.actions').quote_prompt(),
                ['<C-s>']     = require('telescope-live-grep-args.actions').quote_prompt({ postfix = ' --iglob ' }),
                ['<C-space>'] = require('telescope-live-grep-args.actions').to_fuzzy_refine,
              },
            },
          },
        },
      }

      require('telescope').load_extension('live_grep_args')
      require('telescope').load_extension('remote-sshfs')

      -- Telescope keymaps
      local map   = vim.keymap.set
      local builtin = require('telescope.builtin')
      local conns   = require('remote-sshfs.connections')
      local api     = require('remote-sshfs.api')

      map('n', '<leader>fn', '<cmd>Telescope oldfiles<CR>')
      map('n', '<leader>fs', '<cmd>Telescope grep_string<CR>')
      map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
      map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')
      map('n', '<leader>fr', '<cmd>Telescope registers<CR>')
      map('n', '<leader>ft', '<cmd>Telescope treesitter<CR>')

      map('n', '<leader>ff', function()
        local mp = conns.get_current_mount_point()
        if conns.is_connected() and mp and string.find(vim.fn.getcwd(), string.sub(mp, 1, -2), 1, true) then
          api.find_files{}
        else
          builtin.find_files({ no_ignore = true })
        end
      end)

      map('n', '<leader>fg', function()
        local mp = conns.get_current_mount_point()
        if conns.is_connected() and mp and string.find(vim.fn.getcwd(), string.sub(mp, 1, -2), 1, true) then
          api.live_grep{}
        else
          require('telescope').extensions.live_grep_args.live_grep_args()
        end
      end)
    end,
  },
  { 'nvim-telescope/telescope-live-grep-args.nvim', lazy = true },

  -- ----------------------------------------------------------
  -- LSP
  -- ----------------------------------------------------------
  -- { 'neovim/nvim-lspconfig',
  --   config = function()
  --     require("mason").setup({
  --       registries = { "github:crashdummyy/mason-registry", "github:mason-org/mason-registry" },
  --     })
  --     require("mason-lspconfig").setup()
  --     require("roslyn").setup()
  --     require("venv-lsp").setup()
  --     require("blink.cmp").setup({
  --       completion = {
  --         documentation = { auto_show = true },
  --       },
  --       keymap = {
  --         preset = "none",
  --         ["<C-j>"] = { "select_next", "fallback" },
  --         ["<C-k>"] = { "select_prev", "fallback" },
  --         ["<C-l>"] = { "select_and_accept" },
  --       },
  --     })
  --
  --     vim.diagnostic.config({
  --       signs = {
  --         numhl = {
  --           [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
  --           [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
  --           [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
  --           [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
  --         },
  --         text = {
  --           [vim.diagnostic.severity.ERROR] = "X",
  --           [vim.diagnostic.severity.HINT] = "?",
  --           [vim.diagnostic.severity.INFO] = "I",
  --           [vim.diagnostic.severity.WARN] = "!",
  --         },
  --       },
  --       update_in_insert = true,
  --       virtual_text = false,
  --       virtual_lines = { current_line = true },
  --     })
  --   end,
  --   dependencies = {
  --     "seblyng/roslyn.nvim",
  --     "mason-org/mason-lspconfig.nvim",
  --     "jglasovic/venv-lsp.nvim",
  --     "mason-org/mason.nvim",
  --     { "saghen/blink.cmp", build = "cargo build --release" },
  --   },
  --
  -- },

  -- ----------------------------------------------------------
  -- Remote SSHFS
  -- ----------------------------------------------------------
  { 'nosduco/remote-sshfs.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('remote-sshfs').setup()
      local api = require('remote-sshfs.api')
      vim.keymap.set('n', '<leader>rc', api.connect,    {})
      vim.keymap.set('n', '<leader>rd', api.disconnect, {})
      vim.keymap.set('n', '<leader>re', api.edit,       {})
    end,
  },

  -- ----------------------------------------------------------
  -- Session
  -- ----------------------------------------------------------
  { 'rmagatti/auto-session', config = true },

  -- ----------------------------------------------------------
  -- Search / replace
  -- ----------------------------------------------------------
  { 'nvim-pack/nvim-spectre',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('spectre').setup()
      local map = vim.keymap.set
      map('n', '<leader>S',  '<cmd>lua require("spectre").toggle()<CR>',                         { desc = 'Toggle Spectre' })
      map('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',  { desc = 'Search current word' })
      map('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>',               { desc = 'Search current word' })
      map('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', { desc = 'Search on current file' })
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- ----------------------------------------------------------
  -- Wilder
  -- ----------------------------------------------------------
  -- { 'gelguy/wilder.nvim',
  --   build = function() vim.cmd('UpdateRemotePlugins') end,
  --   config = function()
  --     local wilder = require('wilder')
  --     wilder.setup({
  --       modes        = { ':', '/', '?' },
  --       next_key     = '<tab>',
  --       previous_key = '<s-tab>',
  --       accept_key   = '<C-l>',
  --       reject_key   = '<C-h>',
  --     })
  --     wilder.set_option('pipeline', {
  --       wilder.branch(
  --         wilder.cmdline_pipeline({ language = 'vim', fuzzy = 1 })
  --       ),
  --     })
  --     wilder.set_option('renderer', wilder.popupmenu_renderer(
  --       wilder.popupmenu_border_theme({
  --         highlights  = { border = 'Normal' },
  --         border      = 'rounded',
  --         left        = { ' ', wilder.popupmenu_devicons() },
  --         right       = { ' ', wilder.popupmenu_scrollbar() },
  --         highlighter = wilder.basic_highlighter(),
  --         max_height  = '20%',
  --       })
  --     ))
  --   end,
  -- },
  {
    'chipsenkbeil/distant.nvim', 
    branch = 'v0.3',
    config = function()
        require('distant'):setup()
    end
  },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar").setup()
    end
  },
  {
  "kevinhwang91/nvim-hlslens",
  config = function()
    require("scrollbar.handlers.search").setup({
    })
  end,
  },
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        themes = {"gruvbox", "ayu", "sonokai", "kanagawa", "onedark", "molokai", "tokyonight-night", "tokyonight-storm", "tokyonight"},
        livePreview = true, -- Apply theme while picking. Default to true.
      })
    end
  }

  -- ----------------------------------------------------------
  -- Copilot
  -- ----------------------------------------------------------
--  { 'github/copilot.vim' },
--  { 'CopilotC-Nvim/CopilotChat.nvim',
--    dependencies = { 'github/copilot.vim', 'nvim-lua/plenary.nvim' },
--    config = function()
--      require('CopilotChat').setup{}
--    end,
--  },

}, {
  -- lazy.nvim options
  install = { colorscheme = { 'tokyonight-night' } },
})
