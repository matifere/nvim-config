return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "rcasia/neotest-java",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-java")({
            ignore_wrapper = true,
          }),
        },
      })

      -- Keymaps for testing
      vim.keymap.set("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "[T]est [R]un nearest" })
      vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "[T]est [F]ile" })
      vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "[T]est [S]ummary" })
      vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "[T]est [O]utput" })
    end,
  }
}
