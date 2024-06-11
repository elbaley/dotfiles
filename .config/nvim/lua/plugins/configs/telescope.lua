return function(_, opts)
  local telescope = require "telescope"
  telescope.setup(opts)
  telescope.load_extension("harpoon")
  local utils = require "astronvim.utils"
  local conditional_func = utils.conditional_func
  conditional_func(telescope.load_extension, pcall(require, "notify"), "notify")
  conditional_func(telescope.load_extension, pcall(require, "aerial"), "aerial")
  conditional_func(telescope.load_extension, utils.is_available "telescope-fzf-native.nvim", "fzf")
end
