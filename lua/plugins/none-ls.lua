return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
    "jayp0521/mason-null-ls.nvim", -- ensure dependencies are installed
  },
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting -- to setup formatters

    -- Formatters & linters for mason to install
    require("mason-null-ls").setup({
      ensure_installed = {
        "prettier", -- ts/js formatter
        "stylua", -- lua formatter
        "eslint_d", -- ts/js linter
        "csharpier",
      },
      automatic_installation = true,
    })

    local sources = {
      formatting.stylua,
      formatting.prettier.with({
        extra_filetypes = { "html", "css", "json" }, -- Add any specific filetypes you want Prettier to handle
        extra_args = { "--single-quote", "--jsx-single-quote" }, -- Example: Add your preferred prettier config here
      }),
      require("none-ls.diagnostics.eslint_d"),
      formatting.csharpier,
    }

    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    null_ls.setup({
      debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
      sources = sources,
      on_attach = function(client, bufnr)
        -- Use Prettier for formatting
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = false,
                filter = function(format_client)
                  return format_client.name == "null-ls"
                end,
              })
            end,
          })
        end
      end,
    })
  end,
}
