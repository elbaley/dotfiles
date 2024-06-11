return {
  'kdheepak/lazygit.nvim',
  config = function()
    vim.keymap.set('n', '<leader>lg', '<cmd>:Lazygit<cr>', { desc = 'Lazygit' })
    -- vim.g.lazygit_floating_window_scaling_factor = 0.9 -- scaling factor for floating window
  end,
  cmd = {
    'LazyGit',
    'LazyGitConfig',
    'LazyGitCurrentFile',
    'LazyGitFilter',
    'LazyGitFilterCurrentFile',
  },
  -- optional for floating window border decoration
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
}
