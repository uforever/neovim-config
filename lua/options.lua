require "nvchad.options"

local opt = vim.opt
local wo = vim.wo

wo.relativenumber = true
opt.whichwrap = "b,s,<,>,[,]"
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldenable = false
