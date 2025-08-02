return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Manage LSP installations
    { 'williamboman/mason.nvim', opts = {} },
    { 'williamboman/mason-lspconfig.nvim', opts = {
        ensure_installed = {
          'cssls', 
          'html', 
          'eslint', 
          'marksman',
          'emmet_ls', 
          'lua_ls', 
          'vtsls',
          'tailwindcss',
          'vue_ls'
        },
        -- Mason-LSPConfig v2 will auto-enable installed servers
        automatic_enable = true,
      },
    },

    -- Status updates for LSP
    { 'j-hui/fidget.nvim',  opts = {} },

    -- Better Lua support
    'folke/neodev.nvim',
  },

  config = function()
    -- 1. Initialize Mason + Mason-LSPConfig
    require('mason').setup()
    require('mason-lspconfig').setup()                  -- uses opts from Lazy/LazyVim

    -- 2. Shared on_attach + capabilities
    local on_attach = function(client, bufnr)
      local nmap = function(keys, fn, desc)
        if desc then desc = 'LSP: ' .. desc end
        vim.keymap.set('n', keys, fn, { buffer = bufnr, desc = desc })
      end

      -- core LSP mappings
      nmap('gd', vim.lsp.buf.definition,       '[G]oto [D]efinition')
      nmap('gD', vim.lsp.buf.declaration,      '[G]oto [D]eclaration')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', vim.lsp.buf.implementation,   '[G]oto [I]mplementation')
      nmap('K',  vim.lsp.buf.hover,            'Hover Documentation')
      nmap('<leader>rn', vim.lsp.buf.rename,   '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
      nmap('<leader>f', function()             -- formatting
        vim.lsp.buf.format { async = true }
      end, 'LSP Formatting')

      -- Create :Format command
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function()
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    -- local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

    -- 3. Global config applied to *all* servers
    vim.lsp.config('*', {
      on_attach    = on_attach,
      capabilities = capabilities,
    })

    -- 4. Per-server customizations
    -- vim.lsp.config('eslint', {
    --   settings = {
    --     enable         = true,
    --     format         = { enable = true },
    --     autoFixOnSave  = true,
    --     codeActionsOnSave = { mode = 'all' },
    --   },
    --   -- you can also override filetypes here if desired
    -- })
    vim.lsp.enable('emmet_ls')


    vim.lsp.enable('vue_ls')
    vim.lsp.enable('vtsls')
    -- Example: override Tailwind filetypes
    vim.lsp.config('tailwindcss', {
      filetypes = { 'javascript', 'typescript', 'vue', 'css', 'scss' },
       settings = {
        tailwindCSS = {
          classaFunctions = { "cva", "cx" },
            experimental = {
              classRegex = {
                "cva\\(([^)]*)\\)",
                "[\"'`]([^\"'`]*).*?[\"'`]",
              },
            },
          
       }},
  })

    -- Note: any server not in Mason’s registry (e.g. custom ones)
    -- you can still do:
    -- require('lspconfig').gdscript.setup({ cmd = {'gdscript-language-server', '--stdio'} })
  end,
}
