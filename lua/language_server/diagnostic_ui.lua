local fidget_status_ok, fidget = pcall(require, "fidget")
if not fidget_status_ok then
	return
end

local lspsaga_status_ok, lspsaga = pcall(require, "lspsaga")
if not lspsaga_status_ok then
	return
end

fidget.setup({
	text = {
		spinner = "dots_pulse", -- 转圈动画
	},
	window = {
		border = "none", -- 边框
	},
	timer = {
		spinner_rate = 500, -- 转圈速度
		fidget_decay = 3000, -- 保留时间
		task_decay = 0,
	},
	fmt = {
		max_width = 0, -- 最大宽度
		task = function(task_name, _, percentage)
			return string.format(
				"%s [%s]",
				percentage and string.format(" (%s%%)", percentage) or "",
				task_name
			)
		end,
	},
}) -- lsp加载进度

lspsaga.init_lsp_saga({
	use_saga_diagnostic_sign = true,
	error_sign = " ",
	warn_sign = " ",
	hint_sign = " ",
	infor_sign = " ",
	dianostic_header_icon = "   ",
	code_action_icon = " ",
	code_action_prompt = {
		enable = true,
		sign = true,
		sign_priority = 20,
		virtual_text = true,
	},
	finder_definition_icon = "  ",
	finder_reference_icon = "  ",
	max_preview_lines = 10, -- 最大预览行数
	finder_action_keys = {
		-- open = "o",
		open = "<CR>",
		vsplit = "s",
		split = "i",
		-- quit = "q",
		quit = "<ESC>",
		scroll_down = "<C-f>",
		scroll_up = "<C-b>",
	},
	code_action_keys = {
		-- quit = "q",
		quit = "<ESC>",
		exec = "<CR>",
	},
	rename_action_keys = {
		-- quit = "<C-c>",
		quit = "<ESC>",
		exec = "<CR>",
	},
	definition_preview_icon = "  ",
	border_style = "single",
	rename_prompt_prefix = "➤",
}) -- lsp客户端UI

vim.diagnostic.config({
	-- virtual_text = {
	-- 	source = "always", -- 显示错误提示来源
	-- 	prefix = '●', -- 文本前缀
	-- },
	virtual_text = false,
	float = {
		source = "always", -- 显示错误提示来源
	},
	signs = true, -- 显示错误提示符号
	underline = true, -- 显示错误提示下划线
	update_in_insert = false, -- 不在插入模式下更新错误提示
	severity_sort = true, -- 按错误等级排序
}) -- 诊断样式 这个配置必须放在lspsaga后面 否则不会生效