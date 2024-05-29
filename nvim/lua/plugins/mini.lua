return {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    require('mini.pairs').setup()
    require('mini.comment').setup()
    require('mini.trailspace').setup()
    require('mini.files').setup()
    require('mini.indentscope').setup()

    local notify = require('mini.notify')
    notify.setup()
    vim.notify = notify.make_notify()
  end
}
