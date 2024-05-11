---@type ChadrcConfig
local M = {}

M.ui = {
  -- https://github.com/NvChad/base46
  hl_add = {
    -- https://github.com/RRethy/vim-illuminate
    -- IlluminatedWordText = {
    --   bg = "one_bg",
    -- },
    -- IlluminatedWordRead = {
    --   bg = "one_bg",
    -- },
    -- IlluminatedWordWrite = {
    --   bg = "one_bg",
    -- },
  },
  theme = "draculase",
  theme_toggle = { "draculase", "chadracula" },

  telescope = { style = "bordered" },

  nvdash = {
    load_on_startup = true,

    header = {
      "                                      ",
      "                         ▄   ▄        ",
      "         ▄   ▄           █▀█▀█        ",
      "     ▄█▄ █▀█▀█ ▄█▄       █▄█▄█        ",
      "    ▀▀████▄█▄████▀▀       ███  ▄▄     ",
      "         ▀█▀█▀            ████▐█ █    ",
      "                          ████   █    ",
      "                          ▀▀▀▀▀▀▀     ",
      "                                      ",
    },

    buttons = {
      { "  Find File", "<C-f> f", "Telescope find_files" },
      { "  Recent Files", "<C-f> o", "Telescope oldfiles" },
      { "󰈚  Find Text", "<C-f> t", "Telescope live_grep" },
      { "  Themes", "<C-f> c", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  cheatsheet = {
    theme = "grid",
    excluded_groups = {
      "terminal (t)",
      "autopairs",
      "Nvim",
      "comment (x)",
      "Shrink (x)",
      "Start",
      "Increment (x)",
      ":help",
      "Show",
      "Opens",
    },
  },

  lsp = { signature = true },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
