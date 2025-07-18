return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"lua",
					"vim",
					"vimdoc",
					"javascript",
					"html",
					"python",
					"proto",
					"typescript",
					"tsx",
				},
				auto_install = true,
				highlight = { enable = true },
				sync_install = false,
				indent = { enable = true },
			})
		end,
	},
}
