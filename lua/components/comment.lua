local status_ok, comment = pcall(require, "Comment")
if not status_ok then
	return
end

local comment_keymaps = require("keymaps").comment

comment.setup({
	padding = true, -- 注释符后是否留空格
	sticky = true, -- 注释后是否保持光标位置
	-- ignore = nil, -- 不注释的类型
	toggler = {
		line = comment_keymaps, -- 注释当前行
		-- block = nil, -- 注释当前块
	}, -- 注释快捷键
	opleader = {
		line = comment_keymaps, -- 注释当前行
		-- block = nil, -- 注释当前块
	}, -- 注释快捷键
	mappings = {
		basic = true, -- 默认快捷键
		extra = false, -- 额外快捷键
	}, -- 注释快捷键
	-- pre_hook = nil,
	-- post_hook = nil,
})
