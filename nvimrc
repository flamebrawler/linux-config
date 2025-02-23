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
Plug 'sudormrfbin/cheatsheet.nvim'


"Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }

call plug#end()

set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu


map <silent><esc> :noh <CR>
map <silent><C-c> :noh <CR>
nnoremap <C-s> <C-a>
"
" Find files using Telescope command-line sugar.

nnoremap <leader>ff :lua require('telescope.builtin').find_files({ no_ignore = true })<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fr <cmd>Telescope registers<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>


let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
let g:conflict_marker_begin = '^<<<<<<<\+ .*$'
let g:conflict_marker_common_ancestors = '^======\+ .*$'
let g:conflict_marker_end   = '^>>>>>>>\+ .*$'

highlight ConflictMarkerBegin guibg=#288573
highlight ConflictMarkerOurs guibg=#2b665a
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

let g:conflict_marker_enable_mappings = 0
nmap ]c <Plug>(conflict-marker-next-hunk)
nmap [c <Plug>(conflict-marker-prev-hunk)
nmap ct <Plug>(conflict-marker-themselves)
nmap co <Plug>(conflict-marker-ourselves)
nmap cn <Plug>(conflict-marker-none)
nmap cb <Plug>(conflict-marker-both)
nmap cB <Plug>(conflict-marker-both-rev)

" let g:coq_settings = { 'auto_start': v:true }
" let g:coq_settings = { 'auto_start': 'shut-up' }


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
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
nnoremap <silent> <C-s-p>  <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bn <Cmd>BufferOrderByName<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>


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
    vimgrep_arguments = {
        'rg', '--ignore', '--hidden', '--no-ignore-vcs', '--vimgrep', '-g', '*.{c,h,py,cxx,hxx,txt,md,json}'
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

require('lualine').setup{
	options = {
		icons_enabled = true,
		theme  = 'ayu_dark',
	},
}
END
