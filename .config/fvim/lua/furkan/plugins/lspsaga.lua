return {
  'nvimdev/lspsaga.nvim',
  config = function()
    vim.keymap.set('n', 'gd', '<cmd>:Lspsaga goto_definition<cr>', { desc = 'LSPSaga: Go to definition' })
    vim.keymap.set('n', 'gr', '<cmd>:Lspsaga finder<cr>', { desc = 'LSPSaga: Go to references' })
    vim.keymap.set('n', 'K', '<cmd>:Lspsaga hover_doc<cr>', { desc = 'LSPSaga: Hover menu' })
    vim.keymap.set('n', '<leader>la', '<cmd>:Lspsaga code_action<cr>', { desc = 'LSPSaga: Code action' })
    require('lspsaga').setup {
      ui = {
        code_action = '',
      },
      --INFO: removed winbar in favor of barbecue.nvim
      symbol_in_winbar = {
        enable = false,
      },
    }
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter', -- optional
    'nvim-tree/nvim-web-devicons', -- optional
  },
}
