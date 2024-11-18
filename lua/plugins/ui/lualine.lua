-- Lualine (improved status line)
return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = "|",
				section_separators = "",
				theme = "tokyonight",
			},
			sections = {
				lualine_x = {},
				lualine_c = { { "filename", path = 3 } },
			},
		})
	end,
}
