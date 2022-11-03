local status_ok, ident_blankline = pcall(require, "indent_blankline")
if not status_ok then
	return
end

ident_blankline.setup({
	space_char_blankline = " ", --
	show_current_context = true,
	show_current_context_start = false,
	-- filetype_exclude = {}, -- 不显示参考线的文件类型
	char = "▏", -- 竖线样式
})
