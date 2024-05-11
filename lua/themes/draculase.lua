local M = {}

M.base_30 = {
  white = "#F8F8F2",
  darker_black = "#1C1B26",
  black = "#22212C",
  black2 = "#282733",
  one_bg = "#2C2B37",
  one_bg2 = "#454158",
  one_bg3 = "#7970A9",
  grey = "#444C5B",
  grey_fg = "#4E5665",
  grey_fg2 = "#58606F",
  light_grey = "#626A79",
  red = "#FF9580",
  baby_pink = "#FF80BF",
  pink = "#EE9CDD",
  line = "#303847",
  green = "#8AFF80",
  vibrant_green = "#20E3B2",
  nord_blue = "#8BC2F0",
  blue = "#89B4FA",
  yellow = "#FFFF80",
  sun = "#F6D96D",
  purple = "#BD93F9",
  dark_purple = "#9580FF",
  teal = "#92A2D4",
  orange = "#FFCA80",
  cyan = "#80FFEA",
  statusline_bg = "#232B3A",
  lightbg = "#2B2B4C",
  pmenu_bg = "#9A86FD",
  folder_bg = "#9A86FD",
  violet = "#9A86FD",
  darkgreen = "#1B312E",
  brownred = "#5D2932",
}

M.base_16 = {
  base00 = "#22212C",
  base01 = M.base_30.one_bg,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = M.base_30.grey,
  base05 = "#E9E9F4",
  base06 = "#F1F2F8",
  base07 = "#F7F7FB",
  base08 = "#C197FD",
  base09 = "#FFB86C",
  base0A = "#62D6E8",
  base0B = "#E5C697",
  base0C = "#8BE9FD",
  base0D = "#20E3B2",
  base0E = "#FF6BCB",
  base0F = "#7E7EB5",
}

M.polish_hl = {
  treesitter = {
    ["@function.builtin"] = { fg = M.base_30.cyan },
    ["@number"] = { fg = M.base_30.purple },
    ["@module"] = { fg = M.base_30.white },
    ["@function.call"] = { fg = M.base_30.vibrant_green },
    ["@function"] = { fg = M.base_30.green },
    ["@keyword.repeat"] = { fg = M.base_30.green },
  },

  syntax = {
    Include = { fg = M.base_30.pink },
    Error = { fg = M.base_30.red },
    Identifier = { fg = M.base_30.white },
    Function = { fg = M.base_30.vibrant_green },
    String = { fg = M.base_30.orange },
    Keyword = { fg = M.base_30.pink },
    Constant = { fg = M.base_30.violet },
    Type = { fg = M.base_30.blue },
  },

  git = {
    DiffAdd = { fg = M.base_30.darkgreen },
    DiffDelete = { fg = M.base_30.brownred },
  },

  nvimtree = {
    NvimTreeFolderName = { fg = M.base_30.white },
    NvimTreeOpenedFolderName = { fg = M.base_30.white, bold = true },
  },
}

M.type = "dark"

return M
