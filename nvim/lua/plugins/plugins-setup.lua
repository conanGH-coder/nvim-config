local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    { 'projekt0n/github-nvim-theme', name = 'github-theme' }, -- 主题
    "EdenEast/nightfox.nvim",                               -- 主题
    "folke/tokyonight.nvim",                                -- 主题
    { "catppuccin/nvim", name = "catppuccin", priority = 1000,
      config = function()
            require("catppuccin").setup({
                transparent_background = true,
                term_colors = false,
                styles = {
                    comments = { "italic" },
                    conditionals = { "italic" },
                    functions = { "italic" },
                    properties = { "italic" },
                },
                custom_highlights = function(colors)
                    return {
                        Folded = { bg = colors.none },
                    }
                end,
            })
        end,
    }, -- 主题
    {
        "nvim-lualine/lualine.nvim",                        -- 状态栏
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "nvim-tree/nvim-tree.lua",
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim", -- 这个相当于mason.nvim和lspconfig的桥梁
        "neovim/nvim-lspconfig"
    },
    -- 自动补全
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip", -- snippets引擎，不装这个自动补全会出问题
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-path",                                                                     -- 文件路径

    "windwp/nvim-autopairs",                                                                -- 自动补全括号

    "lewis6991/gitsigns.nvim",                                                              -- 左侧git提升

    "nvim-treesitter/nvim-treesitter",                                                      -- 语法高亮

    { 'akinsho/bufferline.nvim',     version = "*",                                     dependencies = 'nvim-tree/nvim-web-devicons' }, -- 缓冲区

    { 'nvimdev/lspsaga.nvim',        dependencies = { 'nvim-treesitter/nvim-treesitter' } },
    "onsails/lspkind-nvim",

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',                              -- 文件检索
        dependencies = { { 'nvim-lua/plenary.nvim' } } -- requires要改为dependencies
    },
    {
        "startup-nvim/startup.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope-file-browser.nvim" },
    },

}

local opts = {} -- 注意要定义这个变量

require("lazy").setup(plugins, opts)
