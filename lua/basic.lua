-- Neovim 基础选项
local basic_options = {
	autoindent = true, -- 自动缩进
	autoread = true, -- 文件变化时自动读取
	background = "dark", -- 背景颜色
	backup = false, -- 不生成备份文件
	clipboard = "unnamedplus", -- 使用系统剪贴板
	cmdheight = 2, -- 命令行高度
	colorcolumn = "80", -- 80列参考线 超过的话考虑换行
	completeopt = "menu,menuone,noselect,noinsert", -- 补全选项
	cursorline = true, -- 高亮当前行
	encoding = "utf-8", -- 编码
	expandtab = false, -- 不使用空格代替tab
	fileencoding = "utf-8", -- 文件编码
	hidden = true, -- 允许切换buffer时隐藏当前buffer
	hlsearch = true, -- 高亮搜索结果
	ignorecase = true, -- 搜索时忽略大小写 除非包含大写字母
	incsearch = true, -- 输入搜索内容时就高亮搜索结果
	mouse = "a", -- 允许鼠标操作
	number = true, -- 显示行号
	pumheight = 10, -- 菜单高度
	relativenumber = true, -- 相对行号
	scrolloff = 8, -- 光标移动到屏幕顶部和底部时保持8行距离
	shiftround = false, -- 缩进不使用shiftwidth的整数倍
	shiftwidth = 4, -- 缩进宽度
	showmode = false, -- 不显示模式 后续使用插件替代
	showtabline = 2, -- 显示标签栏
	sidescrolloff = 8, -- 光标移动到屏幕左侧和右侧时保持8列距离
	signcolumn = "yes", -- 显示标记列 后续插件会用到
	smartcase = true, -- 搜索时忽略大小写 除非包含大写字母
	smartindent = true, -- 智能缩进
	softtabstop = 4, -- 编辑时tab键的宽度
	splitbelow = true, -- 水平分屏时新窗口在下方
	splitright = true, -- 垂直分屏时新窗口在右侧
	swapfile = false, -- 不生成交换文件
	tabstop = 4, -- tab键的宽度
	termguicolors = true, -- 开启24位颜色
	timeoutlen = 300, -- 等待键盘快捷键连击时间
	updatetime = 100, -- 更新时间
	whichwrap = "<,>,[,]", -- 光标移动到行首或行尾时换行
	wildmenu = true, -- 命令行模式下使用菜单选择
	wrap = false, -- 不自动换行
	writebackup = false -- 不生成备份文件
}

for k, v in pairs(basic_options) do
	vim.opt[k] = v
end
