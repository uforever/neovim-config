local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers", -- 显示所有缓冲区
		numbers = "none", -- 不显示标签栏序号
		close_command = "Bdelete! %d", -- 关闭命令
		right_mouse_command = "Bdelete! %d", -- 右键关闭命令
		indicator = {
			icon = '▎', -- 标签栏分隔符
			style = 'icon' -- 标签栏分隔符样式
		},
		offsets = { {
			filetype = "NvimTree", -- 文件树
			text = "File Tree", -- 标签栏显示的文本
			text_align = "center", -- 文本居中
			separator = true -- 分隔符
		} },
		color_icons = true, -- 颜色图标
		sort_by = "directory", -- 排序方式
		diagnostics = "nvim_lsp", -- 使用内置LSP诊断
		diagnostics_indicator = function(count, level, _, _)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end
	}
})
