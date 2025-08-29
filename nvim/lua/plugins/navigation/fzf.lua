local preview_on = { winopts = { preview = { hidden = "nohidden" } } }
return {
    "ibhagwan/fzf-lua",
    -- -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons", "folke/trouble.nvim" },
    keys = {
        { "<leader>ff", "<cmd>FzfLua files<cr>",        mode = { "n", "v" }, desc = "[F]zf find [f]iles" },
        { "<leader>fl", "<cmd>FzfLua lines<cr>",        mode = { "n", "v" }, desc = "[F]zf open buffer [l]ines" },
        { "<leader>fg", "<cmd>FzfLua live_grep<cr>",    mode = { "n", "v" }, desc = "[F]zf live [g]rep" },
        { "<leader>fb", "<cmd>FzfLua buffers<cr>",      mode = { "n", "v" }, desc = "[F]zf [b]uffers" },
        { "<leader>fw", "<cmd>FzfLua grep_cword<cr>",   mode = { "n", "v" }, desc = "[F]zf current [w]ord" },
        { "<leader>fc", "<cmd>FzfLua lgrep_curbuf<cr>", mode = { "n", "v" }, desc = "[F]zf [c]urrent buffer" },
        {
            "<leader>fs",
            function()
                require("fzf-lua").lsp_document_symbols(preview_on)
            end,
            mode = { "n", "v" },
            desc = "[F]ind [s]ymbols",
        },
    },
    config = function(_, opts)
        require("fzf-lua").setup(opts)
        local config = require("fzf-lua.config")
        local actions = require("trouble.sources.fzf").actions
        config.defaults.actions.files["ctrl-q"] = actions.open
    end,
    opts = {
        fzf_colors = true,
        winopts = {
            preview = { hidden = "hidden" },
        },
        defaults = {
            git_icons = false,
            file_icons = false,
            -- keymap = {
            -- fzf = {
            --     ["ctrl-q"] = "select-all+accept",
            -- },
            -- },
        },
        files = {
            cwd_prompt = false,
        },
        live_grep = preview_on,
        grep = preview_on,
        lsp = preview_on,
    },
}
