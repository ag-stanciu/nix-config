return {
    -- Colorschemes
    {
        'folke/tokyonight.nvim',
        lazy = true,
    },
    {
        "neanias/everforest-nvim",
        lazy = true,
    },
    {
        "jasonlong/poimandres.nvim",
        lazy = true,
    },

    -- UI
    {
        "j-hui/fidget.nvim",
        event = "VeryLazy",
        opts = {
            progress = {
                display = {
                    done_icon = "󰸞",
                }
            }
        }
    },

    {
        'karb94/neoscroll.nvim',
        event = "VeryLazy",
        config = function()
            require("neoscroll").setup()
        end
    },

    -- Misc
    {
        'norcalli/nvim-colorizer.lua',
        event = "BufReadPost",
        config = function()
            require("colorizer").setup()
        end
    },
    {
        'kylechui/nvim-surround',
        event = "VeryLazy",
        opts = true,
    },

    {
        'akinsho/git-conflict.nvim',
        event = "BufReadPost",
        version = "*",
        opts = true
    },
    {
        'luukvbaal/statuscol.nvim',
        event = "VeryLazy",
        config = true,
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        opts = {
            input_buffer_type = "dressing"
        }
    },
    -- {
    --     "folke/trouble.nvim",
    --     cmd = { "TroubleToggle", "Trouble" },
    --     opts = { use_diagnostic_signs = true },
    --     keys = {
    --         { "<leader>dx", "<cmd>TroubleToggle document_diagnostics<cr>",  desc = "Document Diagnostics (Trouble)" },
    --         { "<leader>wx", "<cmd>TroubleToggle workspace_diagnostics<cr>", desc = "Workspace Diagnostics (Trouble)" },
    --     },
    -- },
}
