-- load defaults
local configs = require "nvchad.configs.lspconfig"
local conf = require("chadrc").ui.lsp
-- change mappings
local mappings = require("mappings").lsp

-- custom on_attach function
local on_attach = function(client, bufnr)
  mappings(bufnr)
  if conf.signature and client.server_capabilities.signatureHelpProvider then
    require("nvchad.lsp.signature").setup(client, bufnr)
  end
end
configs.on_attach = on_attach
configs.defaults()

local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
-- https://github.com/helix-editor/helix/wiki/Language-Server-Configurations
-- install first and then add here
local servers = { "html", "cssls", "jsonls", "tsserver", "clangd" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- lsps with custom config

-- Python: ruff_lsp + pyright
-- https://github.com/astral-sh/ruff-lsp?tab=readme-ov-file#example-neovim
lspconfig.ruff_lsp.setup {
  on_attach = function(client, bufnr)
    mappings(bufnr)
    client.server_capabilities.hoverProvider = false
  end,
  on_init = on_init,
}
lspconfig.pyright.setup {
  settings = {
    pyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = {
        ignore = { "*" },
      },
    },
  },
  on_init = on_init,
}

-- Rust: rust_analyzer
lspconfig.rust_analyzer.setup {
  -- https://github.com/rust-lang/rust-analyzer/blob/master/docs/user/generated_config.adoc
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
  on_attach = function(_, bufnr)
    mappings(bufnr)
  end,
  on_init = on_init,
}
