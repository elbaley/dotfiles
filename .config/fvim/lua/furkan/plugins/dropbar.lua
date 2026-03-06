return {
  'Bekaboo/dropbar.nvim',
  -- optional, but required for fuzzy finder support
  dependencies = {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
  },
  config = function()
    local dropbar_api = require 'dropbar.api'
    vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
    vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
    vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })

    -- highlight fix
    vim.api.nvim_create_autocmd('ColorScheme', {
      command = 'hi WinBar guibg=NONE | hi WinBarNC guibg=NONE',
    })

    vim.api.nvim_create_autocmd({ 'WinEnter', 'WinLeave' }, {
      callback = function()
        vim.cmd 'hi WinBar guibg=NONE | hi WinBarNC guibg=NONE | hi DropBarWinBar guibg=NONE | hi DropBarWinBarNC guibg=NONE'
      end,
    })
  end,
}
