return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	{
		"saghen/blink.cmp",
		version = "*", -- Use latest stable version
		dependencies = {
			"L3MON4D3/LuaSnip",
			version = "v2.3.0",
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = { preset = "default" }, -- Tab to accept, arrow keys to navigate
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			snippets = {
				preset = "default",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "supermaven" },
			},
		},
	},
}
