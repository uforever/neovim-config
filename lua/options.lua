require "nvchad.options"

local opt = vim.opt
local wo = vim.wo
local o = vim.o

wo.relativenumber = true
opt.whichwrap = "b,s,<,>,[,]"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false

if vim.g.neovide then
  o.guifont = "FiraCode Nerd Font,JetBrainsMono Nerd Font,Cascadia Code:h11"
  -- o.guifont = "FiraCode Nerd Font:h14"
end
