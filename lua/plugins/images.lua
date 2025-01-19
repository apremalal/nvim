return {
	"3rd/image.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("image").setup({
			processor = "magick_cli",
		})
	end,
}
