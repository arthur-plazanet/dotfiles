return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('plugins.config.nvim-tree')
  end,
}
