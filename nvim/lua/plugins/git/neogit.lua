return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required

    -- Only one of these is needed.
    "nvim-telescope/telescope.nvim", -- optional
  },

  cmd = "Neogit",

  keys = {
    { "<leader>gn", "<cmd>Neogit<cr>", desc = "Open Neogit" },
  },

  config = function()
    require("neogit").setup({
      disable_commit_confirmation = true,
      integrations = { diffview = true },
    })
  end,
}
