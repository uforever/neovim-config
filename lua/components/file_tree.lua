local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

local file_tree_keymaps = require("keymaps").file_tree

vim.g.loaded_netrw = 1 -- 禁用netrw
vim.g.loaded_netrwPlugin = 1 -- 防止netrw插件冲突

nvim_tree.setup({
	actions = {
		open_file = {
			quit_on_open = false, -- 打开文件时关闭
			resize_window = true -- 大小适配
		}
	}, -- 行为
	auto_reload_on_write = true, -- 自动重载
	diagnostics = {
		enable = true, -- 启用诊断
		show_on_dirs = true, -- 显示在目录上
		icons = {
			hint = "", -- 提示
			info = "", -- 信息
			warning = "", -- 警告
			error = "" -- 错误
		}
	}, -- 诊断
	disable_netrw = true, -- 禁用netrw
	filters = {
		dotfiles = true,
		custom = { "node_modules" },
		exclude = {}
	}, -- 过滤选项
	git = {
		enable = true,
		ignore = true,
		timeout = 400
	}, -- 显示 git 状态图标
	hijack_cursor = false, -- 不禁用光标
	hijack_netrw = true, -- 劫持netrw
	open_on_setup = false, -- 启动时不自动开启文件树
	open_on_setup_file = false, -- 打开文件时不自动开启
	renderer = {
		highlight_git = false, -- 文件名高亮
		icons = {
			webdev_colors = true, -- webdev图标颜色
			git_placement = "after" -- git状态图标位置
		}
	}, -- 渲染器
	sort_by = "name", -- 排序方式
	sync_root_with_cwd = true, -- 同步根目录
	respect_buf_cwd = true, -- 项目管理需要的配置
	update_focused_file = {
		enable = true, -- 启用更新
		update_root = true, -- 更新根目录
		ignore_list = {}
	},
	view = {
		width = 32, -- 宽度
		side = "left", -- 位置
		hide_root_folder = false, -- 隐藏根目录
		mappings = {
			custom_only = true, -- 只使用自定义映射
			list = file_tree_keymaps
		}, -- 自定义快捷键
		number = false, -- 不显示行数
		signcolumn = "yes" -- 显示图标
	} -- 外观
})
