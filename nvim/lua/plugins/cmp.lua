-- lua/plugins/cmp.lua
local M = {
  -- Autocompletion
  "hrsh7th/nvim-cmp",
  dependencies = {
    -- Snippet engine
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Snippet collection (VS Code-style)
    "rafamadriz/friendly-snippets",

    -- You don't strictly need cmp-nvim-lsp here, we'll use it in lsp.lua
    -- but you could also list it here if you prefer.
    -- Adds LSP completion capabilities
    'hrsh7th/cmp-nvim-lsp',
  },
}

function M.config()
  local cmp = require("cmp")
  local luasnip = require("luasnip")


  -- TODO: Not loaded
  -- Load VS Code-style snippets (including friendly-snippets)
  require("luasnip.loaders.from_vscode").lazy_load({
    paths = "~/config/nvim/lua/config/snippets/vscode",
  })


  -- Your custom Lua snippets
  require("luasnip.loaders.from_lua").lazy_load({
    paths = "~/config/nvim/lua/config/snippets",
  })

  cmp.setup({
    snippet = {
      expand = function(args)
        -- This makes LSP snippet items actually expand
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Tab>"] = cmp.mapping.select_next_item(),
      ["<S-Tab>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      }),
      -- You can still leave <Tab> free for Copilot
    }),
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" }, -- <- this is how friendly-snippets show up
      -- add more (buffer, path, etc.) if you want
    },
  })
end

return M
