return {
  "nvim-tree/nvim-tree.lua",
  enabled = true,
  -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Installation#lazy-loading
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require('plugins.config.nvim-tree')
  end,
}
