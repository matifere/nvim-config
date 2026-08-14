-- Archivo: lua/custom/plugins/formatting.lua
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' }, -- Se activa justo antes de guardar
  cmd = { 'ConformInfo' },
  keys = {
    {
      -- Atajo manual por si quieres formatear sin guardar: <Leader>f
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_fallback = true }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    formatters_by_ft = {
      javascript = { 'prettier' },
      typescript = { 'prettier' },
      json = { 'prettier' },
      css = { 'prettier' },
      html = { 'prettier' },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true, -- Si prettier falla, intenta usar el LSP
    },
  },
}
