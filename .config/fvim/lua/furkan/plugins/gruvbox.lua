return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = true,
  opts = {
    terminal_colors = true, -- add neovim terminal colors
    undercurl = true,
    underline = true,
    bold = false,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true, -- invert background for search, diffs, statuslines and errors
    contrast = '', -- can be "hard", "soft" or empty string
    overrides = {
      StatusLine = { bg = '#282828', fg = '#d5c4a1' },
      ['@include.typescript'] = { fg = '#fb4934' },
      ['@variable.typescript'] = { fg = '#83a598' },
      ['@punctuation.bracket.typescript'] = { fg = '#928374' },
    },
    dim_inactive = false,
    transparent_mode = false,
  },
}
