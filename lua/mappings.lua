require "nvchad.mappings"

local M = {}
local nomap = vim.keymap.del
local map = vim.keymap.set

nomap("i", "<C-b>")
nomap("i", "<C-h>")
nomap("i", "<C-l>")
nomap("i", "<C-j>")
nomap("i", "<C-k>")
nomap("n", "<C-h>")
nomap("n", "<C-l>")
nomap("n", "<C-j>")
nomap("n", "<C-k>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
-- nomap("n", "<leader>lf")
nomap("n", "[d")
nomap("n", "]d")
-- nomap("n", "<leader>q")
nomap("n", "<leader>b")
nomap("n", "<tab>")
nomap("n", "<S-tab>")
nomap("n", "<leader>x")
-- nomap("n", "<C-n>")
-- nomap("n", "<leader>e")
nomap("n", "<leader>fw")
nomap("n", "<leader>fb")
nomap("n", "<leader>fh")
nomap("n", "<leader>ma")
nomap("n", "<leader>fo")
nomap("n", "<leader>fz")
nomap("n", "<leader>cm")
nomap("n", "<leader>gt")
nomap("n", "<leader>pt")
nomap("n", "<leader>th")
nomap("n", "<leader>ff")
nomap("n", "<leader>fa")
nomap("t", "<C-x>")
nomap("n", "<leader>h")
nomap("n", "<leader>v")
nomap("n", "<M-v>")
nomap("n", "<M-h>")
nomap("n", "<leader>wk")
nomap("n", "<leader>wK")
nomap("n", "<leader>cc")

-- general
map("i", "jk", "<Esc>", { desc = "general quit insert" })
map("i", "<Esc>", "`", { desc = "general ` for 60% keyboard" })
map("n", "qq", "<cmd>qa<CR>", { desc = "general quit all" })

-- move
map("i", "<C-a>", "<Home>", { desc = "move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "move end of line" })
map("v", "<", "<gv", { desc = "move decrease indent" })
map("v", ">", ">gv", { desc = "move increase indent" })
map("v", "<M-j>", ":move '>+1<CR>gv-gv", { desc = "move swap down" })
map("v", "<M-k>", ":move '<-2<CR>gv-gv", { desc = "move swap up" })

-- <leader>w
-- window
map("n", "<leader>wh", "<C-w>h", { desc = "window move to left" })
map("n", "<leader>wl", "<C-w>l", { desc = "window move to right" })
map("n", "<leader>wj", "<C-w>j", { desc = "window move to down" })
map("n", "<leader>wk", "<C-w>k", { desc = "window move to up" })
map("n", "<leader>w<BS>", "<C-w>c", { desc = "window close current" })
map("n", "<leader>w<CR>", "<C-w>o", { desc = "window close others" })
map("n", "<C-l>", "<C-w>o", { desc = "window close others" })

-- treesitter
M.treesitter = {
  init_selection = "<CR>",
  node_incremental = "<CR>",
  scope_incremental = "<tab>",
  node_decremental = "<BS>",
}

-- <leader>d
-- diagnostic
map("n", "<leader>dp", vim.diagnostic.open_float, { desc = "diagnostic print detail" })
map("n", "<leader>dk", vim.diagnostic.goto_prev, { desc = "diagnostic prev" })
map("n", "<leader>dj", vim.diagnostic.goto_next, { desc = "diagnostic next" })
map("n", "<leader>dl", vim.diagnostic.setloclist, { desc = "diagnostic list" })

-- <leader>g
-- gitsigns
-- lsp
M.gitsigns = function(bufnr)
  local gs = package.loaded.gitsigns

  local function opts(desc)
    return { buffer = bufnr, desc = "gitsigns " .. desc }
  end

  map("n", "<leader>gb", gs.blame_line, opts "blame line")
  map("n", "<leader>gs", gs.preview_hunk, opts "preview hunk")
  map("n", "<leader>gr", gs.reset_hunk, opts "reset hunk")
end
M.lsp = function(bufnr)
  local function opts(desc)
    return { buffer = bufnr, desc = "LSP " .. desc }
  end

  map({ "n", "v" }, "<leader>ga", vim.lsp.buf.code_action, opts "code action")
  map("n", "<leader>gd", vim.lsp.buf.definition, opts "go to definition")
  map("n", "<leader>gu", vim.lsp.buf.references, opts "show references")
  map("n", "<leader>gn", function()
    require "nvchad.lsp.renamer"()
  end, opts "rename")
  map("n", "<leader>gh", vim.lsp.buf.hover, opts "hover information")

  map("n", "<leader>gp", vim.lsp.buf.signature_help, opts "show signature help")
  map("n", "<leader>gi", vim.lsp.buf.implementation, opts "go to implementation")
  map("n", "<leader>gt", vim.lsp.buf.type_definition, opts "go to type definition")
  map("n", "<leader>gl", vim.lsp.buf.declaration, opts "Go to declaration")

  map("n", "<leader>g;", function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
  end, opts "toggle inlay hints")
  -- map("n", "<leader>ge", vim.lsp.buf.add_workspace_folder, opts "enter workspace folder")
  -- map("n", "<leader>gq", vim.lsp.buf.remove_workspace_folder, opts "quit workspace folder")
  -- map("n", "<leader>gw", function()
  --   print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  -- end, opts "workspace folders")
end

-- <leader>t
-- tabufline
map("n", "<leader>tl", function()
  require("nvchad.tabufline").next()
end, { desc = "tabufline next" })

map("n", "<leader>th", function()
  require("nvchad.tabufline").prev()
end, { desc = "tabufline prev" })

map("n", "<leader>t<BS>", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "tabufline close current" })

map("n", "<leader>t<CR>", function()
  require("nvchad.tabufline").closeOtherBufs()
end, { desc = "tabufline close others" })

-- comment
-- <leader>/  for Line
-- <M-/>      for Block
map(
  "v",
  "<M-/>",
  "<ESC><cmd>lua require('Comment.api').toggle.blockwise(vim.fn.visualmode())<CR>",
  { desc = "comment block" }
)

-- nvimtree
map("n", "<F3>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

M.nvimtree = function(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  map("n", "<CR>", api.node.open.edit, opts "open")
  map("n", "l", api.node.open.vertical, opts "split")
  map("n", "q", api.tree.close, opts "close")
  map("n", "<F5>", api.tree.reload, opts "refresh")
  map("n", "d", api.fs.remove, opts "delete")
  map("n", "x", api.fs.cut, opts "cut")
  map("n", "p", api.fs.paste, opts "paste")
  map("n", "o", api.fs.create, opts "create")
  map("n", "y", api.fs.copy.node, opts "copy")
  map("n", "s", api.fs.rename_full, opts "rename")
  map("n", "<C-f>", api.live_filter.start, opts "filter")
  map("n", "<C-l>", api.live_filter.clear, opts "clear filter")
  map("n", "b", api.tree.toggle_no_buffer_filter, opts "toggle buffer")
  map("n", ".", api.tree.toggle_hidden_filter, opts "toggle dotfiles")
  map("n", "i", api.tree.toggle_gitignore_filter, opts "toggle ignore")
  map("n", "?", api.tree.toggle_help, opts "help")
  map("n", "<Tab>", api.node.run.system, opts "system open")
  map("n", "n", api.fs.copy.filename, opts "copy filename")
  map("n", "a", api.fs.copy.absolute_path, opts "copy absolute path")
  map("n", "r", api.fs.copy.relative_path, opts "copy relative path")
  map("n", "z", api.tree.expand_all, opts "expand all")
end

-- <C-f>
-- telescope
map("n", "<C-f>t", "<cmd>Telescope live_grep<CR>", { desc = "telescope text live grep" })
map("n", "<C-f>b", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<C-f>d", "<cmd>Telescope help_tags<CR>", { desc = "telescope find docs" })
map("n", "<C-f>h", "<cmd>Telescope git_commits<CR>", { desc = "telescope history git commits" })
map("n", "<C-f>g", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<C-f>c", "<cmd>Telescope themes<CR>", { desc = "telescope color themes" })
map("n", "<C-f>f", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<C-f>o", "<cmd>Telescope oldfiles<cr>", { desc = "telescope recent files" })
map(
  "n",
  "<C-f>a",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

M.telescope = function(actions)
  return {
    ["<C-l>"] = actions.cycle_history_next,
    ["<C-h>"] = actions.cycle_history_prev,
    ["<Esc>"] = actions.close,
    ["<C-k>"] = actions.preview_scrolling_up,
    ["<C-j>"] = actions.preview_scrolling_down,
  }
end

M.fittencode = function()
  local fitten = require "fittencode"
  map("i", "<C-f>", function()
    if fitten.has_suggestions() then
      fitten.accept_all_suggestions()
    end
  end, { desc = "fittencode accept all", silent = true })
  map("i", "<C-l>", function()
    if fitten.has_suggestions() then
      fitten.accept_line()
    end
  end, { desc = "fittencode accept line", silent = true })
  map("i", "<C-j>", function()
    if fitten.has_suggestions() then
      fitten.accept_word()
    end
  end, { desc = "fittencode accept word", silent = true })
end

return M
