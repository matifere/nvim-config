-- Archivo: lua/custom/plugins/typescript-lsp.lua
return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    settings = {
      -- Preferencias para que los imports de NestJS funcionen bien
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all', -- Muestra nombres de argumentos (como en IntelliJ)
        includeCompletionsForModuleExports = true,
        quotePreference = 'single', -- Nest suele usar comillas simples
        importModuleSpecifierPreference = 'non-relative', -- Prefiere imports absolutos si están configurados
      },
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = true,
      },
    },
    on_attach = function(client, bufnr)
      -- Atajo rápido para ordenar imports (muy útil en Nest)
      -- <Leader>oi = Organize Imports
      vim.keymap.set('n', '<leader>oi', ':TSToolsOrganizeImports<CR>', { buffer = bufnr, desc = 'Organize Imports' })

      -- Atajo para renombrar archivo y actualizar todos los imports
      vim.keymap.set('n', '<leader>rf', ':TSToolsRenameFile<CR>', { buffer = bufnr, desc = 'Rename File' })
    end,
  },
}
