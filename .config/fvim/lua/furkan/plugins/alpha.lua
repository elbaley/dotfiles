return {
  'goolord/alpha-nvim',
  config = function()
    require('alpha').setup(require('alpha.themes.dashboard').config)
    local dashboard = require 'alpha.themes.dashboard'

    -- local datetime = os.date ' %d-%m-%Y'
    local datetime = os.date ' %A %d %Y' -- "%A" -> Pazar, Pazartesi, ..., "%d" -> 01, 02, ..., "%Y" -> 2023, 2024, ...
    -- Set header
    dashboard.section.header.val = {
      '███████╗██╗   ██╗██╗███╗   ███╗',
      '██╔════╝██║   ██║██║████╗ ████║',
      '█████╗  ██║   ██║██║██╔████╔██║',
      '██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║',
      '██║      ╚████╔╝ ██║██║ ╚═╝ ██║',
      '╚═╝       ╚═══╝  ╚═╝╚═╝     ╚═╝',
      '        ' .. datetime,
    }
  end,
}
