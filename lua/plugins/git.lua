return {
  'lewis6991/gitsigns.nvim',
  opts = {
    current_line_blame_opts = { ignore_whitespace = true}
  },
  config  = function()
    require("gitsigns").setup()

    vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns blame_line<cr>", { desc = "Git blame line" })
    vim.keymap.set("n", "<leader>gB", "<cmd>Gitsigns blame<cr>", { desc = "Git blame file" })
  end
}
