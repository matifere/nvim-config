return {
  'beauwilliams/focus.nvim',
  config = function()
    require('focus').setup {
      enable = true,
      autoresize = {
        enable = true,
        width = 120, -- Ajusta esto si tu monitor es muy grande o pequeño
      },
      ui = {
        cursorline = true,
        signcolumn = true,
      },
    }

    -- Ignorar tipos de ventana que no queremos que cambien de tamaño
    local ignore_filetypes = { 'neo-tree', 'NvimTree', 'TelescopePrompt', 'flutterToolsOutline', 'toggleterm' }
    local augroup = vim.api.nvim_create_augroup('FocusDisable', { clear = true })

    vim.api.nvim_create_autocmd('WinEnter', {
      group = augroup,
      callback = function(_)
        if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
          vim.w.focus_disable = true
        else
          vim.w.focus_disable = false
        end
      end,
    })

    -- Atajos de teclado
    vim.keymap.set('n', '<leader>ft', ':FocusToggle<CR>', { desc = '[F]ocus [T]oggle' })
    vim.keymap.set('n', '<leader>fw', ':FocusMaximizedToggle<CR>', { desc = '[F]ocus [W]indow Maximize' })
  end,
}
