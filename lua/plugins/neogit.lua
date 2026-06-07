return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim"
    },
    config = function()
        local neogit = require('neogit')
        vim.keymap.set("n", "<leader>ng", ":Neogit<cr>", {})
        --[[
        vim.keymap.set("n",
            "<leader>ng",
            function() neogit.open({ kind = "vsplit" }) end,
            { desc = "Open NeoGit UI" }
        )
        ]]--
    end
}

