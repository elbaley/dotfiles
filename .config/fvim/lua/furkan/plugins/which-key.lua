return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'
    require('which-key').setup()
    wk.add {
      { '<leader>f', group = 'file' }, -- group
      {
        '<leader>b',
        group = 'buffers',
        expand = function()
          return require('which-key.extras').expand.buf()
        end,
      },
      { '<leader>s', group = 'search' },
      { '<leader> ', desc = 'arena ◯' },
    }
  end,
}
