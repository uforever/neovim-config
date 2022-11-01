local status_ok, treesitter_configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local syntax_parser_keymaps = require("keymaps").syntax_parser

treesitter_configs.setup({
    ensure_installed = {"bash", "c", "cpp", "css", "go", "html", "java", "javascript", "json", "lua", "make",
                        "markdown", "perl", "php", "python", "ruby", "rust", "sql", "toml", "tsx", "typescript", "vim",
                        "vue", "yaml"}, -- 确保安装的类型
    ignore_install = {"latax"}, -- 忽略安装的类型

    highlight = {
        enable = true, -- 启用语法高亮
        additional_vim_regex_highlighting = false -- 关闭默认的正则表达式高亮
    }, -- 代码高亮模块

    incremental_selection = {
        enable = true, -- 启用增量选择
        keymaps = syntax_parser_keymaps.incremental_selection
    }, -- 增量选择模块

    indent = {
        enable = false -- 不启用自动缩进
    }, -- 缩进模块

    refactor = {
        highlight_definitions = {
            enable = true, -- 不启用高亮定义
            clear_on_cursor_move = true -- 光标离开时清除高亮
        }, -- 启用高亮定义
        highlight_current_scope = {
            enable = false -- 不启用高亮当前范围
        }, -- 高亮当前范围
        smart_rename = {
            enable = false, -- 不启用智能重命名
            keymaps = syntax_parser_keymaps.refactor.smart_rename
        }, -- 智能重命名
        navigation = {
            enable = true, -- 启用重名导航
            keymaps = syntax_parser_keymaps.refactor.navigation
        } -- 重名导航
    }, -- 重构模块

    rainbow = {
        enable = true, -- 启用彩虹括号
        extended_mode = true, -- 启用扩展模式 支持更多分隔符
        max_file_lines = nil -- 限制文件行数
    } -- 彩虹括号模块
})

vim.opt.foldmethod = "expr" -- 开启代码折叠模块
vim.opt.foldexpr = "nvim_treesitter#foldexpr()" -- 开启代码折叠模块
vim.opt.foldlevel = 99
-- vim.opt.foldminlines = 10 -- 折叠最小行数
-- vim.opt.foldnestmax = 10 -- 折叠最大嵌套数
