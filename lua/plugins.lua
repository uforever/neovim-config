local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup({
    function(use)
        use("wbthomason/packer.nvim") -- 插件管理
        use "nvim-lua/plenary.nvim" -- 插件依赖
        use("folke/tokyonight.nvim") -- 颜色主题TokyoNight
        -- use("navarasu/onedark.nvim") -- 颜色主题OneDark
        -- use("shaunsingh/nord.nvim") -- 颜色主题Nord
        use("nvim-treesitter/nvim-treesitter-refactor") -- 重构模块
        use("p00f/nvim-ts-rainbow") -- 彩虹括号
        use({
            "nvim-treesitter/nvim-treesitter",
            run = ":TSUpdate"
        }) -- 语法高亮

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
