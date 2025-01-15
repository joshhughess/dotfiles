return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("trouble").setup({})
    vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace Diagnostics" })
    vim.keymap.set(
      "n",
      "<leader>td",
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      { desc = "Document Diagnostics" }
    )
  end,
}
