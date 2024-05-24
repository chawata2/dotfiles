vim.api.nvim_create_user_command(
  'F',
  function()
    require('mini.files').open()
  end,
  {}
)
