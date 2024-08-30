return {
  'dzfrias/arena.nvim',
  event = 'BufWinEnter',
  config = function()
    vim.keymap.set('n', '<leader><leader>', '<cmd>ArenaToggle<cr>', { desc = 'Arena toggle' })

    -- require('arena').setup {
    --   max_items = 9,
    -- }
    require('arena').setup {
      -- Maxiumum number of files that the arena window can contain, or `nil` for
      -- an unlimited amount
      max_items = 9,
      -- Always show the enclosing directory for these paths
      always_context = { 'mod.rs', 'init.lua' },
      -- When set, ignores the current buffer when listing files in the window.
      ignore_current = false,
      -- Options to apply to the arena buffer.
      buf_opts = {
        -- ["relativenumber"] = false,
      },
      -- Filter out buffers per the project they belong to.
      per_project = false,
      --- Add devicons (from nvim-web-devicons, if installed) to buffers
      devicons = true,

      window = {
        width = 60,
        height = 10,
        border = 'rounded',

        -- Options to apply to the arena window.
        opts = {},
      },

      -- Keybinds for the arena window.
      keybinds = {
        -- ["e"] = function()
        --   vim.cmd("echo \"Hello from the arena!\"")
        -- end
      },

      -- Change the way the arena listing looks with custom rendering functions
      renderers = {},
      -- Config for frecency algorithm.
      algorithm = {
        -- Multiplies the recency by a factor. Must be greater than zero.
        -- A smaller number will mean less of an emphasis on recency!
        recency_factor = 0.5,
        -- Same as `recency_factor`, but for frequency!
        frequency_factor = 1,
      },
    }
  end,
}
