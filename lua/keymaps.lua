local keymap = vim.api.nvim_set_keymap
local buf_keymap = vim.api.nvim_buf_set_keymap
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
keymap("t", "<Leader>wh", [[ <C-\><C-n><C-w>h ]], term_opts) -- 切换到左侧窗口
keymap("t", "<Leader>wj", [[ <C-\><C-n><C-w>j ]], term_opts) -- 切换到下方窗口
keymap("t", "<Leader>wk", [[ <C-\><C-n><C-w>k ]], term_opts) -- 切换到上方窗口
keymap("t", "<Leader>wl", [[ <C-\><C-n><C-w>l ]], term_opts) -- 切换到右侧窗口
keymap("t", "jk", [[ <C-\><C-n> ]], opts) -- 退出终端
keymap("v", "<", "<gv", opts) -- 选中区域连续左移
keymap("v", ">", ">gv", opts) -- 选中区域连续右移
keymap("v", "J", ":move '>+1<CR>gv-gv", opts) -- 选中区域连续下移
keymap("v", "K", ":move '<-2<CR>gv-gv", opts) -- 选中区域连续上移

local M = {}

M.syntax_parser = {
	incremental_selection = {
		init_selection = "<CR>", -- 初始化选择
		node_incremental = "<CR>", -- 扩大节点
		node_decremental = "<BS>", -- 缩小节点
		scope_incremental = "<TAB>" -- 扩大范围
	}, -- 增量选择模块
	refactor = {
		smart_rename = {
			smart_rename = nil -- 智能重命名
		}, -- 智能重命名
		navigation = {
			goto_definition = nil, -- 跳转到定义
			list_definitions = nil, -- 列出定义
			list_definitions_toc = nil, -- 列出定义目录
			goto_next_usage = "<leader>gn", -- 跳转到下一个使用
			goto_previous_usage = "<leader>gp" -- 跳转到上一个使用
		} -- 重名导航
	} -- 重构模块
} -- 语法分析

M.language_server = function(bufnr)
	buf_keymap(bufnr, "n", "<Leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- 重命名
	buf_keymap(bufnr, "n", "<Leader>gi", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- 显示信息
	buf_keymap(bufnr, "n", "<Leader>gu", "<cmd>lua vim.lsp.buf.references()<CR>", opts) -- 显示引用
	buf_keymap(bufnr, "n", "<Leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- 跳转到定义
	buf_keymap(bufnr, "n", "<leader>ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- 代码动作
	buf_keymap(bufnr, "n", "<Leader>fm", "<cmd>lua vim.lsp.buf.format()<CR>", opts) -- 格式化
	buf_keymap(bufnr, "n", "<Leader>ep", "<cmd>lua vim.diagnostic.open_float()<CR>", opts) -- 显示错误
	buf_keymap(bufnr, "n", "<Leader>ej", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts) -- 下一个错误
	buf_keymap(bufnr, "n", "<Leader>ek", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts) -- 上一个错误
end -- 语言服务器

return M
