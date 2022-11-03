local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
	function(use)
		use("wbthomason/packer.nvim") -- 插件管理
		use("nvim-lua/plenary.nvim") -- 插件依赖
		use("nvim-tree/nvim-web-devicons") -- 图标
		use("folke/tokyonight.nvim") -- 颜色主题TokyoNight
		-- use("navarasu/onedark.nvim") -- 颜色主题OneDark
		-- use("shaunsingh/nord.nvim") -- 颜色主题Nord
		use("nvim-treesitter/nvim-treesitter-refactor") -- 重构模块
		use("p00f/nvim-ts-rainbow") -- 彩虹括号
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate"
		}) -- 语法高亮
		use("neovim/nvim-lspconfig") -- LSP客户端配置
		use("williamboman/mason.nvim") -- 语言服务管理
		use("williamboman/mason-lspconfig.nvim") -- 语言服务自动安装
		use("onsails/lspkind-nvim") -- LSP美化
		use("hrsh7th/nvim-cmp") -- 自动补全
		use("hrsh7th/vim-vsnip") -- 代码片段
		use("hrsh7th/cmp-vsnip") -- 代码片段
		use("hrsh7th/cmp-buffer") -- 缓冲区
		use("hrsh7th/cmp-nvim-lsp") -- LSP
		use("hrsh7th/cmp-path") -- 文件路径
		use("hrsh7th/cmp-cmdline") -- 命令行
		use("j-hui/fidget.nvim") -- lsp加载进度
		use("kkharji/lspsaga.nvim") -- lsp客户端UI
		use("lukas-reineke/indent-blankline.nvim") -- 缩进参考线
		use("windwp/nvim-autopairs") -- 自动补全括号
		use("numToStr/Comment.nvim") -- 注释
		use("lewis6991/gitsigns.nvim") -- git集成
		use("ahmedkhalf/project.nvim") -- 项目管理
		use("nvim-tree/nvim-tree.lua") -- 文件树
		use("famiu/bufdelete.nvim") -- 删除缓冲区
		use("akinsho/bufferline.nvim") -- 标签栏/面包屑
		use("nvim-lualine/lualine.nvim") -- 状态栏
		use("nvim-telescope/telescope.nvim") -- 模糊搜索
		use("glepnir/dashboard-nvim") -- 启动页

		-- 自动安装packer并同步插件
		if packer_bootstrap then
			require('packer').sync()
		end
	end,
	config = {
		max_jobs = 16, -- 并发数限制
		display = { -- 弹出窗口
			open_fn = function()
				return require('packer.util').float({
					border = 'single'
				})
			end
		}
	}
})
