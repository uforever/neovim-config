return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = require "configs.treesitter",
  },
  {
    "NvChad/nvcommunity",
    { import = "nvcommunity.editor.illuminate" },
    { import = "nvcommunity.editor.treesittercontext" },
    { import = "nvcommunity.lsp.barbecue" },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = function()
      local conf = require "nvchad.configs.gitsigns"
      conf.on_attach = require("mappings").gitsigns
      return conf
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  -- add cmp-cmdline
  {
    "hrsh7th/cmp-cmdline",
    keys = { ":", "/", "?" },
    config = function()
      local cmp = require "cmp"
      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          {
            name = "cmdline",
            option = {
              ignore_cmds = { "Man", "!" },
            },
          },
        }),
      })
    end,
  },
  {
    "numToStr/Comment.nvim",
    opts = { mappings = { basic = false, extra = false } },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = function()
      local conf = require "nvchad.configs.telescope"
      local actions = require "telescope.actions"
      conf.defaults.mappings.i = require("mappings").telescope(actions)
      return conf
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = { indent = { char = "▏" }, scope = { char = "▏" } },
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = function()
      local conf = require "nvchad.configs.nvimtree"
      conf.on_attach = require("mappings").nvimtree
      return conf
    end,
  },
  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-f>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  },
  -- https://github.com/luozhiya/fittencode.nvim
  {
    "luozhiya/fittencode.nvim",
    event = { "InsertEnter" },
    cmd = { "Fitten" },
    config = function()
      require("fittencode").setup {
        use_default_keymaps = false,
      }
      require("mappings").fittencode()
    end,
  },
}
