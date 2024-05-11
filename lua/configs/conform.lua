local options = {
  -- available formatters
  -- https://github.com/stevearc/conform.nvim/tree/master/lua/conform/formatters
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
