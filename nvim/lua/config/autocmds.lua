-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { '*.tsx', '*.ts', '*.jsx', '*.vue' },
--   command = 'silent! EslintFixAll',
--   group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
-- })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   local suave = require('suave')
--   suave.session_store(auto=true)
-- })

-- Formatter
-- local format = vim.api.nvim_create_augroup('format', { clear = true })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   command = 'EslintFixAll',
--   pattern = '*.ts,*.tsx,*.js,*.jsx,*.vue',
--   group = format,
-- })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { '*.tsx', '*.ts', '*.jsx', '*.vue' },
--   command = 'silent! EslintFixAll',
--   group = vim.api.nvim_create_augroup('MyAutocmdsJavaScripFormatting', {}),
-- })

-- vim.api.nvim_create_autocmd('BufWritePre', {
--   group = format,
--   command = 'Neoformat',
-- })