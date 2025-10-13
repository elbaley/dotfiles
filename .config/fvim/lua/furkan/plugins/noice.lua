return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {

    -- add any options here
    routes = {
      { filter = { find = 'E162' }, view = 'mini' },
      { filter = { event = 'msg_show', kind = '', find = '%no code' }, view = 'mini' },
      { filter = { event = 'msg_show', kind = '', find = 'written' }, view = 'mini' },
      { filter = { event = 'msg_show', kind = '', find = '[w]' }, view = 'mini' },
      { filter = { event = 'msg_show', kind = '', find = '%--' }, view = 'mini' },
      { filter = { event = 'msg_show', kind = '', find = 'prettier' }, view = 'mini' },
      { filter = { event = 'msg_show', find = 'search hit BOTTOM' }, skip = true },
      { filter = { event = 'msg_show', find = 'search hit TOP' }, skip = true },
      { filter = { event = 'emsg', find = 'E23' }, skip = true },
      { filter = { event = 'emsg', find = 'E20' }, skip = true },
      { filter = { find = 'No signature help' }, skip = true },
      { filter = { find = 'E37' }, skip = true },
    },
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
}
