-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('KK', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  nmap('<leader>f', function()
    vim.lsp.buf.format { async = true }
  end, 'LSP formatting')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  tsserver = {},
  stylelint_lsp = {},
  cssls = {},
  html = {},
  eslint = {
    -- enable = true,
    format = { enable = true }, -- this will enable formatting
    -- packageManager = "yarn",
    autoFixOnSave = true,
    codeActionsOnSave = {
      mode = "all",
      -- rules = { "!debugger", "!no-only-tests/*" },
    },
    lintTask = {
      enable = true,
    },
  },

  -- vuels = {
  --   settings = {
  --     vetur = {
  --       completion = { autoImport = true, tagCasing = 'Pascal', useScaffoldSnippets = true },
  --     },
  --   },
  -- },
  -- emmet_language_server = {
  --   filetypes = { "css", "html", "javascript",
  --     -- "javascriptreact", "less",
  --     "sass", "scss",
  --     --  svelte", "pug", "typescriptreact",
  --     "vue" }
  -- },
  -- eslint = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  volar = {
    filetypes = { 'vue', 'typescript', 'javascript' },
    -- completion: { autoImport = true, tagCasing = 'Pascal', useScaffoldSnippets = true },
  },
  yamlls = {
    filetypes = { 'yaml', 'yaml.ansible' },
    documentFormatting = true,
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


-- From https://github.com/ericlovesmath/dotfiles/blob/069d1680acd4f130191038bb35db734674806c4c/.config/nvim/lua/plugins/lsp.lua#L40
-- Required for html/cssls because Microsoft
local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function config(_config)
  return vim.tbl_deep_extend("force", {
    on_attach = on_attach,
  }, _config or {})
end

local nvim_lsp = require("lspconfig")


require("mason").setup {
  registries = {
    "github:mason-org/mason-registry@2023-05-15-next-towel"
  }
}


-- -- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  registries = {
    "github:mason-org/mason-registry@2023-05-15-next-towel"
  }
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end,

  -- From https://github.com/ericlovesmath/dotfiles/blob/069d1680acd4f130191038bb35db734674806c4c/.config/nvim/lua/plugins/lsp.lua#L40
  -- Required for html/cssls because Microsoft
  ["html"] = function()
    nvim_lsp.html.setup(config({
      capabilities = capabilities,
    }))
  end,
  ["cssls"] = function()
    nvim_lsp.cssls.setup(config({
      capabilities = capabilities,
    }))
  end
}


-- lspconfig
-- LSP
-- local lspconfig = require 'lspconfig'

-- lspconfig.tsserver.setup {}
-- lspconfig.eslint.setup {}
-- lspconfig.stylelint_lsp.setup {}
-- lspconfig.cssls.setup {}
-- lspconfig.on_attach = on_attach
-- lspconfig.vuels.setup {
--   settings = {
--     vetur = {
--       completion = { autoImport = true, tagCasing = 'initial', useScaffoldSnippets = true },
--     },
--   },
-- }
