return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require 'which-key'
    require('which-key').setup()
    wk.add {
      -- { '<leader>f', group = 'file' }, -- group
      { '<leader>s', group = 'search' },
    }
  end,
}
