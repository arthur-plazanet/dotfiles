return {
  -- Add indentation guides even on blank lines
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  -- Enable `lukas-reineke/indent-blankline.nvim`
  -- See `:help indent_blankline.txt`
  config = function()
    require('plugins.config.indent-blankline')
  end,
}
