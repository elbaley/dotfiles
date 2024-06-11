local function show_macro_recording()
  local recording_register = vim.fn.reg_recording()
  if recording_register == '' then
    return ''
  else
    return 'Recording @' .. recording_register
  end
end
return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'meuter/lualine-so-fancy.nvim',
  },
  config = function()
    local lualine = require 'lualine'
    lualine.setup {
      options = {
        theme = 'seoul256',
        component_separators = { left = '│', right = '│' },
        section_separators = { left = '', right = '' },
        -- component_separators = { left = '', right = '' },
        -- section_separators = { left = '', right = '' },
        globalstatus = true,
        refresh = {
          statusline = 100,
        },
      },
      sections = {
        lualine_a = {
          { 'fancy_mode', width = 0 },
        },
        lualine_b = {
          { 'fancy_branch' },
          { 'fancy_diff' },
        },
        lualine_c = {
          -- { 'fancy_cwd', substitute_home = true },
          { 'filename', path = 1 },
        },
        lualine_x = {
          { 'fancy_macro' },
          { 'fancy_diagnostics' },
          { 'fancy_searchcount' },
          { 'fancy_location' },
        },
        lualine_y = {
          { 'fancy_filetype', ts_icon = '' },
        },
        lualine_z = {
          { '', width = 0 },
        },
      },
    }
  end,
}
