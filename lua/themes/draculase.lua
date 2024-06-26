local M = {}

M.base_30 = {
  white = "#F8F8F2",
  darker_black = "#1C1B26",
  black = "#22212C",
  black2 = "#282733",
  one_bg = "#2C2B37",
  one_bg2 = "#454158",
  one_bg3 = "#7970A9",
  grey = "#424242",
  grey_fg = "#545454",
  grey_fg2 = "#666666",
  light_grey = "#808099",
  red = "#FF9580",
  baby_pink = "#FF80BF",
  pink = "#FF80BF",
  line = "#313131",
  green = "#8AFF80",
  vibrant_green = "#8AFF80",
  nord_blue = "#5DA3F4",
  blue = "#5DA3F4",
  yellow = "#FFFF80",
  sun = "#FFFF80",
  purple = "#9580FF",
  dark_purple = "#9580FF",
  teal = "#92A2D4",
  orange = "#FFCA80",
  cyan = "#80FFEA",
  statusline_bg = "#232B3A",
  lightbg = "#2B2B4C",
  pmenu_bg = "#9580FF",
  folder_bg = "#9580FF",
  violet = "#9580FF",
  darkgreen = "#1B312E",
  brownred = "#5D2932",
}

M.base_16 = {
  base00 = M.base_30.black,
  base01 = M.base_30.one_bg,
  base02 = M.base_30.one_bg2,
  base03 = M.base_30.one_bg3,
  base04 = M.base_30.grey,
  base05 = "#E9E9F4",
  base06 = "#F1F2F8",
  base07 = "#F7F7FB",
  base08 = M.base_30.white,
  base09 = M.base_30.red,
  base0A = M.base_30.cyan,
  base0B = M.base_30.yellow,
  base0C = M.base_30.blue,
  base0D = M.base_30.green,
  base0E = M.base_30.pink,
  base0F = M.base_30.white,
}

M.polish_hl = {
  treesitter = {
    ["@variable.parameter"] = { fg = M.base_30.orange },
    ["@module"] = { fg = M.base_30.green },
    ["@constant"] = { fg = M.base_30.purple },
    ["@constant.builtin"] = { fg = M.base_30.purple },
    ["@string"] = { fg = M.base_30.yellow },
    ["@string.regex"] = { fg = M.base_30.pink },
    ["@string.escape"] = { fg = M.base_30.pink },
    ["@character"] = { fg = M.base_30.orange },
    ["@character.special"] = { fg = M.base_30.orange },
    ["@number"] = { fg = M.base_30.purple },
    ["@number.float"] = { fg = M.base_30.purple },
    ["@attribute"] = { fg = M.base_30.green },
    ["@keyword"] = { fg = M.base_30.pink },
    ["@keyword.repeat"] = { fg = M.base_30.pink },
    ["@function"] = { fg = M.base_30.green },
    ["@function.call"] = { fg = M.base_30.green },
    ["@function.macro"] = { fg = M.base_30.green },
    ["@constructor"] = { fg = M.base_30.white },
    ["@operator"] = { fg = M.base_30.pink },
    ["@type"] = { fg = M.base_30.cyan },
    -- ["@type.builtin"] = { fg = M.base_30.cyan, italic = true },
  },

  syntax = {
    Boolean = { fg = M.base_30.purple },
    Character = { fg = M.base_30.orange },
    Constant = { fg = M.base_30.purple },
    Define = { fg = M.base_30.red, sp = "none" },
    Float = { fg = M.base_30.purple },
    Function = { fg = M.base_30.green },
    Identifier = { fg = M.base_30.green },
    Include = { fg = M.base_30.pink },
    Keyword = { fg = M.base_30.pink },
    Label = { fg = M.base_30.green },
    Number = { fg = M.base_30.purple },
    Operator = { fg = M.base_30.pink, sp = "none" },
    PreProc = { fg = M.base_30.pink },
    Repeat = { fg = M.base_30.orange },
    Tag = { fg = M.base_30.pink },
    Type = { fg = M.base_30.green },
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
