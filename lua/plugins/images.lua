return {
	{
		"3rd/image.nvim",
		commit = "21909e3eb03bc738cce497f45602bf157b396672",
		dependencies = { "nvim-lua/plenary.nvim" },
		build = false,
		config = function()
			require("image").setup({
				backend = "kitty",
				processor = "magick_cli",
				integrations = {
					markdown = {
						enabled = true,
						only_render_image_at_cursor = false,
						download_remote_images = false,
					},
				},
			})
		end,
	},
}
