return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		-- require("mini.pairs").setup()
		require("mini.move").setup()
		require("mini.splitjoin").setup()
	end,
}
