-- vim.opt.termguicolors = true
require 'furkan.core.keymaps'

-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Setting options ]]
-- Make line numbers default
vim.opt.number = true
vim.opt.relativenumber = true
-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'
-- Don't show the mode, since it's already in status line
vim.opt.showmode = false
-- Sync clipboard between OS and Neovim.
vim.opt.clipboard = 'unnamedplus'
-- Enable break indent
vim.opt.breakindent = true
-- Save undo history
vim.opt.undofile = true
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = false
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
-- Show which line your cursor is on
vim.opt.cursorline = true
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- get rid of swapfiles
vim.opt.swapfile = false

vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2

-- [[ Basic Keymaps ]]
vim.keymap.set('n', '<leader>w', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<cr>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>n', '<cmd>enew<cr>', { desc = 'New file' })
vim.keymap.set('n', '<leader>c', '<cmd>:bw<cr>', { desc = 'Close buffer' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>gg', '<cmd>:LazyGit<cr>', { desc = 'Lazygit' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`
-- Remove unused imports on save
-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
--   group = vim.api.nvim_create_augroup('ts_imports', { clear = true }),
--   pattern = { '*.tsx', '*.ts' },
--   callback = function()
--     vim.lsp.buf.code_action {
--       apply = true,
--       context = {
--         only = { 'source.removeUnused.ts' },
--         diagnostics = {},
--       },
--     }
--   end,
--
-- })

vim.api.nvim_create_autocmd('BufWritePost', {
  group = vim.api.nvim_create_augroup('ts_imports', { clear = true }),
  pattern = { '*.tsx', '*.ts' },
  callback = function(args)
    local params = {
      textDocument = vim.lsp.util.make_text_document_params(args.buf),
      range = {
        start = { line = 0, character = 0 },
        ['end'] = { line = vim.fn.line '$', character = 0 },
      },
      context = {
        only = { 'source.removeUnused.ts' },
        diagnostics = {},
      },
    }

    local result = vim.lsp.buf_request_sync(args.buf, 'textDocument/codeAction', params, 3000)

    if result then
      for _, res in pairs(result) do
        if res.result then
          for _, action in pairs(res.result) do
            if action.edit then
              vim.lsp.util.apply_workspace_edit(action.edit, 'utf-8')
            elseif action.command then
              vim.lsp.buf.execute_command(action.command)
            end
          end
        end
      end
      -- Auto-save after removing unused code
      vim.cmd 'silent! write'
    end
  end,
})

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup {
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  { -- You can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- Load the colorscheme here
      -- vim.cmd [[colorscheme tokyonight-moon]]
      -- You can configure highlights by doing something like
      vim.cmd.hi 'Comment gui=none'
    end,
  },
  -- Highlight todo, notes, etc in comments
  {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
    },
  },
  { import = 'furkan.plugins' },
}

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
--

vim.cmd [[highlight Comment gui=italic]]

-- Fix recording macro with lualine :
-- there's going to be a delay in Lualine as by default Lualine only refreshes every second. So what I do is I use Lualine's in-built refresh function to force an update when I enter or exit recording a macro:
vim.api.nvim_create_autocmd('RecordingEnter', {
  callback = function()
    local lualine = require 'lualine'
    lualine.refresh {
      place = { 'statusline' },
    }
  end,
})

vim.api.nvim_create_autocmd('RecordingLeave', {
  callback = function()
    -- This is going to seem really weird!
    -- Instead of just calling refresh we need to wait a moment because of the nature of
    -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
    -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
    -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
    -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
    local timer = vim.loop.new_timer()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        local lualine = require 'lualine'
        lualine.refresh {
          place = { 'statusline' },
        }
      end)
    )
  end,
})
