return {
  -- Plugin de D2 para comandos y detección
  {
    "terrastruct/d2-vim",
    ft = { "d2" },
  },
  -- Añadir 'd2' a la lista de Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        table.insert(opts.ensure_installed, "d2")
      end
    end,
  }
}
