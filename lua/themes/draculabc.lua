local M = {}

M.base_30 = {
  white = "#F8F8F2",
  darker_black = "#1C1B26",
  black = "#22212C",
  black2 = "#282735",
  one_bg = "#2B2A3A",
  one_bg2 = "#3D3C53",
  one_bg3 = "#4B4A67",
  grey = "#5D5E64",
  grey_fg = "#666666",
  grey_fg2 = "#6D6E75",
  light_grey = "#737475",
  red = "#FF9580",
  baby_pink = "#FF99CC",
  pink = "#FF80BF",
  line = "#454158",
  green = "#5BFF4C",
  vibrant_green = "#8AFF80",
  nord_blue = "#92A2D4",
  blue = "#a1b1e3",
  yellow = "#FFFF80",
  sun = "#FFFF99",
  purple = "#9580FF",
  dark_purple = "#BD93F9",
  teal = "#92a2d4",
  orange = "#FFCA80",
  cyan = "#80FFEA",
  statusline_bg = "#2D2F3B",
  lightbg = "#41434F",
  pmenu_bg = "#B389EF",
  folder_bg = "#BD93F9",
}

-- https://github.com/chriskempson/base16/blob/main/styling.md
M.base_16 = {
  base00 = "#22212C",
  base01 = "#393649",
  base02 = "#454158",
  base03 = "#7970A9",
  base04 = "#80FFEA",
  base05 = "#F8F8F2",
  base06 = "#FBFBF7",
  base07 = "#FFFFFF",
  base08 = "#BF99FE",
  base09 = "#FFCA80",
  base0A = "#66D9EF",
  base0B = "#EFFB7B",
  base0C = "#8BE9FE",
  base0D = "#5BFF4C",
  base0E = "#FF86D3",
  base0F = "#F8F8F2",
}

M.polish_hl = {
  ["@function.builtin"] = { fg = M.base_30.cyan },
  ["@number"] = { fg = M.base_30.purple },
}

M.type = "dark"

return M
