return {
  'dzfrias/arena.nvim',
  event = 'BufWinEnter',
  config = function()
    vim.keymap.set('n', '<leader><leader>', '<cmd>ArenaToggle<cr>', { desc = 'Arena toggle' })

    require('arena').setup()
  end,
}
