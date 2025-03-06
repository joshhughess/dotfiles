return {
  {
    "lukas-reineke/virt-column.nvim",
    opts = {
      char = { "┆" },
      virtcolumn = "80",
      highlight = { "NonText" },
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      on_open = function(win)
        vim.api.nvim_win_set_config(win, { zindex = 100 })
      end,
    },
    config = function(_, opts)
      require("notify").setup(opts)
      vim.notify = require("notify") -- Override default notify function
    end,
  },
}
