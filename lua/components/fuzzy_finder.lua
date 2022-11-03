local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local fuzzy_finder_keymaps = require("keymaps").fuzzy_finder

telescope.setup({
	defaults = {
		layout_strategy = "horizontal", -- 弹窗布局方式
		layout_config = {
			prompt_position = "top" -- 搜索框位置

		},
		prompt_prefix = " ", -- 搜索提示符
		selection_caret = " ", -- 选中提示符
		initial_mode = "insert", -- 打开弹窗后进入的初始模式
		mappings = fuzzy_finder_keymaps, -- 模糊查找快捷键
		dynamic_preview_title = true -- 动态预览标题
	},
	extensions = {}
})

telescope.load_extension("projects") -- 项目管理
