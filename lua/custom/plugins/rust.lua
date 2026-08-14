return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recomendado fijar la versión mayor para estabilidad
    lazy = false, -- Importante: Este plugin ya hace su propia carga diferida (lazy loading)
    config = function()
      -- Aquí es donde la magia ocurre.
      -- vim.g.rustaceanvim es una variable global que configura el plugin.
      vim.g.rustaceanvim = {
        -- Configuración del servidor (rust-analyzer)
        server = {
          on_attach = function(client, bufnr)
            -- Aquí puedes poner tus keymaps específicos para Rust si quieres
            -- Por ejemplo, 'K' para ver documentación (hover) ya suele venir por defecto en Nvim moderno
          end,
          default_settings = {
            -- config específica para rust-analyzer
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true, -- Compila con todas las "features" activadas
              },
            },
          },
        },
      }
    end,
  },
}
