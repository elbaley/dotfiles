return {
  'kdheepak/lazygit.nvim',
  keys = {
    { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'Lazygit' },
  },
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
