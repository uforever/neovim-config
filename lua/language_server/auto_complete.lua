local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local lspkind_status_ok, lspkind = pcall(require, "lspkind")
if not lspkind_status_ok then
	return
end

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- vsnip
		end
	}, -- 代码片段
	sources = {
		{ name = "vsnip" }, -- 代码片段
		{ name = "buffer" }, -- 缓冲区
		{ name = "nvim_lsp" }, -- LSP
		{ name = "path" }, -- 文件路径
	},
	mapping = require("keymaps").auto_complete(cmp), -- 键位映射
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text', -- 显示文本
			maxwidth = 50, -- 最大宽度
			ellipsis_char = '...', -- 多出的部分用省略号
			before = function(entry, vim_item)
				vim_item.menu = "[" .. entry.source.name .. "]" -- 显示提示来源
				if vim.tbl_contains({ 'path' }, entry.source.name) then -- path来源提示文件图标优化
					local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
					if icon then
						vim_item.kind = icon
						vim_item.kind_hl_group = hl_group
					end
				end
				return vim_item
			end
		})
	} -- 候选列表样式美化 图标 + 文字
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
}) -- 搜索模式自动补全

cmp.setup.cmdline(":", {
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
}) -- 命令模式自动补全
