return {
  {
    -- El nombre del repositorio del tema
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000, -- IMPORTANTE: Carga este plugin antes que todo lo demas
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha', -- Opciones: latte, frappe, macchiato, mocha (el más oscuro)
        transparent_background = false, -- Cambia a 'true' si quieres ver tu fondo de pantalla
        integrations = {
          cmp = true,
          gitsigns = true,
          nvimtree = true,
          treesitter = true,
          mason = true,
          -- Ajustes para que los menús se vean bien
          telescope = {
            enabled = true,
          },
        },
      }

      -- Esta línea es la que ACTIVA el tema al iniciar
      vim.cmd.colorscheme 'retrobox'
    end,
  },
}
