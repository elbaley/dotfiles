return {
  'imNel/monorepo.nvim',
  config = function()
    require('monorepo').setup {}
    -- switch
    vim.keymap.set('n', '<leader>m', function()
      require('telescope').extensions.monorepo.monorepo()
    end)
    -- add
    vim.keymap.set('n', '<leader>n', function()
      require('monorepo').toggle_project()
    end)
  end,
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
}
