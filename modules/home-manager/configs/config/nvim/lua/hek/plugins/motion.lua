-- return {
--     {
--         "folke/flash.nvim",
--         event = "VeryLazy",
--         opts = {},
--         keys = {
--             {
--                 "s",
--                 mode = { "n", "x", "o" },
--                 function()
--                     -- default options: exact mode, multi window, all directions, with a backdrop
--                     require("flash").jump()
--                 end,
--             },
--             {
--                 "S",
--                 mode = { "o", "x" },
--                 function()
--                     require("flash").treesitter()
--                 end,
--             },
--         },
--     }
-- }
return {
    "echasnovski/mini.ai",
    version = "*",
    config = function ()
        require("mini.ai").setup({
            n_lines = 500
        })
    end
}
