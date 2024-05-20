return {
    
    "nvim-lua/plenary.nvim",

    -- formatting!
    {
        "stevearc/conform.nvim",
        opts = {
        formatters_by_ft = {
            lua = { "stylua" },
        },
        },
        config = function(_, opts)
        require("conform").setup(opts)
        end,
    },

    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = function()
        return require "nvchad.configs.treesitter"
        end,
        config = function(_, opts)
        dofile(vim.g.base46_cache .. "syntax")
        dofile(vim.g.base46_cache .. "treesitter")
        require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- git stuff
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = function()
        return require "nvchad.configs.gitsigns"
        end,
        config = function(_, opts)
        dofile(vim.g.base46_cache .. "git")
        require("gitsigns").setup(opts)
        end,
    },

    -- lsp stuff
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = function()
        return require "nvchad.configs.mason"
        end,
        config = function(_, opts)
        dofile(vim.g.base46_cache .. "mason")
        require("mason").setup(opts)

        -- custom nvchad cmd to install all mason binaries listed
        vim.api.nvim_create_user_command("MasonInstallAll", function()
            if opts.ensure_installed and #opts.ensure_installed > 0 then
            vim.cmd("MasonInstall " .. table.concat(opts.ensure_installed, " "))
            end
        end, {})

        vim.g.mason_binaries_list = opts.ensure_installed
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = function()
        require("nvchad.configs.lspconfig").defaults()
        end,
    },

    {
        "numToStr/Comment.nvim",
        keys = {
        { "gcc", mode = "n", desc = "comment toggle current line" },
        { "gc", mode = { "n", "o" }, desc = "comment toggle linewise" },
        { "gc", mode = "x", desc = "comment toggle linewise (visual)" },
        { "gbc", mode = "n", desc = "comment toggle current block" },
        { "gb", mode = { "n", "o" }, desc = "comment toggle blockwise" },
        { "gb", mode = "x", desc = "comment toggle blockwise (visual)" },
        },
        config = function(_, opts)
        require("Comment").setup(opts)
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = function()
        return require "nvchad.configs.telescope"
        end,
        config = function(_, opts)
        dofile(vim.g.base46_cache .. "telescope")
        local telescope = require "telescope"
        telescope.setup(opts)

        -- load extensions
        for _, ext in ipairs(opts.extensions_list) do
            telescope.load_extension(ext)
        end
        end,
    },
}