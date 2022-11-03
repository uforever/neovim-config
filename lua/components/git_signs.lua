local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "|", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" }, -- 添加
		change = { hl = "GitSignsChange", text = "|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, -- 修改
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, -- 删除
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" }, -- 删除
		changedelete = { hl = "GitSignsChange", text = "|", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" }, -- 修改删除
	},
    signcolumn = true, -- 显示标记列
    numhl      = false, -- 行号高亮
    linehl     = false, -- 行高亮关闭
    word_diff  = false, -- 词级别的差异关闭
})

