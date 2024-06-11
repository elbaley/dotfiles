return {
  'folke/trouble.nvim',
  lazy = true,
  cmd = 'TroubleToggle',
  opts = function()
    return {
      icons = true, -- use devicons for filenames
    }
  end,
}
