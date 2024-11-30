return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("telescope").setup({
      defaults = {
        mappings = {
          i = {
            ["<C-q>"] = function(prompt_bufnr)
              local actions = require("telescope.actions")
              local builtin = require("telescope.builtin")
              actions.send_to_qflist(prompt_bufnr)
              builtin.quickfix()
            end,
          },
        },
      },
    })

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
    vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
    vim.keymap.set("n", "<leader>qf", builtin.quickfix, { desc = "[S]earch [Q]uick[F]ix" })
    vim.keymap.set("n", "<leader>qh", builtin.quickfixhistory, { desc = "[S]earch [Q]uickfix[H]istory" })
    vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "[S]earch [F]iles" })
    vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
    vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
    vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
  end,
}
