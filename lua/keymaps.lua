local keymap = vim.api.nvim_set_keymap
local opts = {
    noremap = true,
    silent = true
}
local term_opts = {
    silent = true
}

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("i", "<C-a>", "<ESC>I", opts) -- 光标移动到行首
keymap("i", "<C-e>", "<ESC>A", opts) -- 光标移动到行尾
keymap("i", "<Esc>", "`", opts) -- 针对60%键盘配置
keymap("i", "jk", "<Esc>", opts) -- 退出插入模式
keymap("n", "<A-h>", ":vert res -2<CR>", opts) -- 窗口宽度减2
keymap("n", "<A-j>", ":res -2<CR>", opts) -- 窗口高度减2
keymap("n", "<A-k>", ":res +2<CR>", opts) -- 窗口高度加2
keymap("n", "<A-l>", ":vert res +2<CR>", opts) -- 窗口宽度加2
keymap("n", "<C-j>", "8j", opts) -- 光标向下移动8行
keymap("n", "<C-k>", "8k", opts) -- 光标向上移动8行
keymap("n", "<C-s>", ":w<CR>", opts) -- 保存
keymap("n", "<Esc>", "~", opts) -- 针对60%键盘配置
keymap("n", "<Leader>'", ":sp | terminal<CR>", opts) -- 打开终端
keymap("n", "<Leader>aa", "<C-w>=", opts) -- 窗口平均分割
keymap("n", "<Leader>sh", ":set nospr | vs | set spr<CR>", opts) -- 左侧分屏
keymap("n", "<Leader>sj", ":sp<CR>", opts) -- 下方分屏
keymap("n", "<Leader>sk", ":set nosb | sp | set sb<CR>", opts) -- 上方分屏
keymap("n", "<Leader>sl", ":vs<CR>", opts) -- 右侧分屏
keymap("n", "<Leader>w<BS>", "<C-w>c", opts) -- 关闭当前窗口
keymap("n", "<Leader>w<CR>", "<C-w>o", opts) -- 关闭其他窗口
keymap("n", "<Leader>wh", "<C-w>h", opts) -- 切换到左侧窗口
keymap("n", "<Leader>wj", "<C-w>j", opts) -- 切换到下方窗口
keymap("n", "<Leader>wk", "<C-w>k", opts) -- 切换到上方窗口
keymap("n", "<Leader>wl", "<C-w>l", opts) -- 切换到右侧窗口
keymap("t", "<Leader>wh", [[ <C-\><C-n><C-w>h ]], opts) -- 切换到左侧窗口
keymap("t", "<Leader>wj", [[ <C-\><C-n><C-w>j ]], opts) -- 切换到下方窗口
keymap("t", "<Leader>wk", [[ <C-\><C-n><C-w>k ]], opts) -- 切换到上方窗口
keymap("t", "<Leader>wl", [[ <C-\><C-n><C-w>l ]], opts) -- 切换到右侧窗口
keymap("t", "jk", [[ <C-\><C-n> ]], opts) -- 退出终端
keymap("v", "<", "<gv", opts) -- 选中区域连续左移
keymap("v", ">", ">gv", opts) -- 选中区域连续右移
keymap("v", "J", ":move '>+1<CR>gv-gv", opts) -- 选中区域连续下移
keymap("v", "K", ":move '<-2<CR>gv-gv", opts) -- 选中区域连续上移
