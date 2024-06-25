return {
    {
        "stevearc/conform.nvim",
        event = "BufWritePre", -- uncomment for format on save
        config = function()
            require "configs.conform"
        end,
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require("nvchad.configs.lspconfig").defaults()
            require "configs.lspconfig"
        end,
    },
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua-language-server",
                "stylua",
                "html-lsp",
                "css-lsp",
                "typescript-language-server",
                "tailwindcss-language-server",
                "eslint-lsp",
                "js-debug-adapter",
                "emmet-language-server",
            },
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "vim",
                "lua",
                "vimdoc",
                "html",
                "css",
                "javascript",
                "typescript",
                "c",
            },
        },
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "html",
        },
        config = function()
            require("nvim-ts-autotag").setup()
        end,
    },
    {
        "SmiteshP/nvim-navic",
        event = "LspAttach",
        config = function()
            dofile(vim.g.base46_cache .. "navic")

            require("nvim-navic").setup {
                highlight = true,
                lsp = { auto_attach = true },
            }

            vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"
        end,
    },
}
