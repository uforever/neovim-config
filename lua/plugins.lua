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