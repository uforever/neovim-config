local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local hide_in_width = function()
	return vim.fn.winwidth(0) > 80
end

local diagnostics = {
	"diagnostics",
	sources = { "nvim_diagnostic" },
	sections = { "error", "warn" },
	symbols = {
		error = " ",
		warn = " "
	},
	colored = true,
	update_in_insert = false,
	always_visible = false
}

local diff = {
	"diff",
	colored = true,
	symbols = {
		added = " ",
		modified = " ",
		removed = " "
	},
	cond = hide_in_width
}

local fileformat = {
	"fileformat",
	symbols = {
		unix = "",
		mac = "",
		dos = ""
	}
}

local mode = {
	"mode",
	fmt = function(str)
		return "-- " .. str .. " --"
	end
}

local filetype = {
	"filetype",
	icons_enabled = true -- 文件图标
}

local branch = {
	"branch",
	icons_enabled = true,
	icon = ""
}

local location = {
	"location",
	padding = 1 -- 边距
}

-- local lsp_progress = {
-- 	"lsp_progress",
-- 	spinner_symbols = { " ", " ", " ", " ", " ", " " }
-- } -- TODO lsp进度条

lualine.setup({
	options = {
		icons_enabled = true, -- 图标
		theme = 'auto', -- 主题
		component_separators = {
			left = "",
			right = ""
		}, -- 组件中分隔符
		section_separators = {
			left = " ",
			right = ""
		}, -- 分隔符
		disabled_filetypes = { -- 禁用文件类型
			statusline = { "NvimTree", "dashboard", "TelescopePrompt" },
			winbar = {}
		},
		globalstatus = true -- 全局状态栏
	},
	sections = {
		lualine_a = { branch, diagnostics },
		lualine_b = { mode },
		lualine_c = { "filename", diff },
		-- lualine_x = {lsp_progress, fileformat, "encoding", filetype},
		lualine_x = { "searchcount", fileformat, "encoding", filetype },
		lualine_y = { location },
		lualine_z = { "progress" }
	}
})
