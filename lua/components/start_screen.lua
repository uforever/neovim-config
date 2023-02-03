local status, db = pcall(require, "dashboard")
if not status then
	return
end

db.setup({
	theme = 'hyper',
	config = {
		week_header = {
			enable = true,
		},
		shortcut = {
			{
				desc = ' Find text',
				group = 'Number',
				action = 'Telescope live_grep',
				key = 't',
			},
			{
				desc = ' Find file',
				group = 'Label',
				action = 'Telescope find_files',
				key = 'f',
			},
			{
				desc = ' Edit keymaps',
				group = 'DiagnosticHint',
				action = 'edit ~/.config/nvim/lua/keymaps.lua',
				key = 'e',
			},
		},
		packages = { enable = true }, -- 显示插件信息
		project = { limit = 4, icon = '󱃷', label = ' Projects', action = 'Telescope find_files cwd=' },
		mru = { limit = 8, icon = '', label = ' Recently files', },
		footer = {},
	},
})
