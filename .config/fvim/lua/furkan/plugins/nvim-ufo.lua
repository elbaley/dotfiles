return {
  'kevinhwang91/nvim-ufo',
  event = 'BufReadPost',
  init = function()
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
    vim.o.foldcolumn = '0'
    vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
  end,
  -- cmd = {
  --   'UfoEnable',
  --   'UfoDisable',
  --   'UfoInspect',
  --   'UfoAttach',
  --   'UfoDetach',
  --   'UfoEnableFold',
  --   'UfoDisableFold',
  -- },
  dependencies = 'kevinhwang91/promise-async',

  config = function()
    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
    require('ufo').setup {
      provider_selector = function(bufnr, filetype, buftype)
        return { 'lsp', 'indent' }
      end,
    }
  end,
}
