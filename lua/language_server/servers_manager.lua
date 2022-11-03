local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
	return
end

local mason_lsp_status_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lsp_status_ok then
	return
end

local lsp_config_status_ok, lsp_config = pcall(require, "lspconfig")
if not lsp_config_status_ok then
	return
end

local cmp_nvim_lsp_status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status_ok then
	return
end

local servers = {
	lua = "sumneko_lua" -- Lua
	-- go = "gopls", -- Go
	-- python = "pyright", -- Python
	-- ruby = "solargraph", -- Ruby
} -- 语言服务

local mason_settings = {
	ui = {
		border = "single", -- 窗口边框
		icons = {
			package_installed = "✓", -- 已安装
			package_pending = "➜", -- 安装中
			package_uninstalled = "✗" -- 未安装
		}
	}
} -- Mason配置

mason.setup(mason_settings) -- 初始化Mason

local ensure_installed_servers = {} -- 确保安装的服务

for _, server in pairs(servers) do
	table.insert(ensure_installed_servers, server)
end

mason_lsp.setup({
	ensure_installed = ensure_installed_servers, -- 确保安装的服务
	automatic_installation = false -- 都逐个配置 这个选项不用太关心
}) -- 初始化MasonLSP

local language_server_keymaps = require("keymaps").language_server -- 语言服务快捷键

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

local general_opts = {
	flags = {
		debounce_text_changes = 150 -- 延迟文本变更
	},
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = true -- 启用格式化
		client.server_capabilities.documentRangeFormattingProvider = false -- 不启用范围格式化
		language_server_keymaps(bufnr) -- 映射快捷键
	end,
	capabilities = capabilities,
} -- 通用选项

local servers_handlers = {}

for language, server in pairs(servers) do
	local status_ok, specific_opts = pcall(require, "language_server.languages." .. language) -- 加载语言服务特定配置
	if not status_ok then
		specific_opts = {}
	end
	servers_handlers[server] = function()
		lsp_config[server].setup(vim.tbl_deep_extend("force", general_opts, specific_opts)) -- 合并配置
	end
end

mason_lsp.setup_handlers(servers_handlers) -- 初始化MasonLSP处理器
