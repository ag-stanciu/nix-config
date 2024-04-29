return {
    {
        -- Telescope
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
            { 'nvim-telescope/telescope-ui-select.nvim' },
        },
        keys = {
            { "<leader><space>", "<cmd>Telescope buffers<CR>" },
            { "<leader>ff",      "<cmd>Telescope find_files<CR>" },
            { "<leader>fg",      "<cmd>Telescope git_files<CR>" },
            { "<leader>fb",      "<cmd>Telescope current_buffer_fuzzy_find<CR>" },
            { "<leader>fh",      "<cmd> Telescope help_tags<CR>" },
            { "<leader>ft",      "<cmd> Telescope tags<CR>" },
            { "<leader>fs",      "<cmd> Telescope grep_string<CR>" },
            { "<leader>fw",      "<cmd> Telescope live_grep<CR>" },
            { "<leader>?",       "<cmd> Telescope oldfiles<CR>" },
            { "<leader>gt",      "<cmd> Telescope git_status<CR>" },
            { "<leader>fr",      "<cmd> Telescope lsp_references<CR>" },
            { "<leader>sr",      "<cmd> Telescope resume<CR>" }
        },
        config = function()
            local telescope = require("telescope")
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local u = require("hek.util")

            -- Telescope
            telescope.setup(
                {
                    defaults = {
                        mappings = {
                            i = {
                                ["<esc>"] = actions.close,
                                ["<Tab>"] = "move_selection_previous",
                                ["<S-Tab>"] = "move_selection_next",
                            },
                        },
                        vimgrep_arguments = {
                            "rg",
                            "--color=never",
                            "--no-heading",
                            "--with-filename",
                            "--line-number",
                            "--column",
                            "--smart-case"
                        },
                        prompt_prefix = "  ",
                        selection_caret = " ▶ ",
                        entry_prefix = "   ",
                        initial_mode = "insert",
                        selection_strategy = "reset",
                        sorting_strategy = "descending",
                        layout_strategy = "horizontal",
                        results_title = "",
                        layout_config = {
                            horizontal = {
                                prompt_position = "bottom",
                                preview_width = 0.55,
                                results_width = 0.8
                            },
                            vertical = {
                                mirror = false,
                            },
                            width = 0.80,
                            height = 0.80,
                            preview_cutoff = 120
                        },
                        file_sorter = require("telescope.sorters").get_fuzzy_file,
                        file_ignore_patterns = {},
                        generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
                        -- path_display = { "absolute" },
                        winblend = 0,
                        border = true,
                        -- borderchars = { "" },
                        borderchars = {
                            -- u.border_square,
                            prompt = u.border_chars_outer_thin_telescope_prompt,
                            results = u.border_chars_outer_thin_telescope,
                            preview = u.border_chars_outer_thin_telescope
                        },
                        color_devicons = true,
                        use_less = true,
                        set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
                        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
                        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
                        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
                        -- Developer configurations: Not meant for general override
                        buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
                        path_display = {
                            filename_first = {
                                reverse_directories = true
                            }
                        }
                    },
                    extensions = {
                        fzf = {
                            fuzzy = true,                    -- false will only do exact matching
                            override_generic_sorter = false, -- override the generic sorter
                            override_file_sorter = true,     -- override the file sorter
                            case_mode = "smart_case"         -- or "ignore_case" or "respect_case"
                            -- the default case_mode is "smart_case"
                        },
                        ["ui-select"] = {
                            require("telescope.themes").get_dropdown(),
                        }
                    },
                }
            )
            telescope.load_extension('fzf')
            telescope.load_extension('ui-select')

            --Add leader shortcuts
            vim.keymap.set("n", "<leader>fu", function ()
                local word = vim.fn.expand("<cword>")
                builtin.grep_string({ search = word })

            end)
        end
    },
}
