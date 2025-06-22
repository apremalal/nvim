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
			{
				"L3MON4D3/LuaSnip",
				version = "v2.3.0",
			},
			{
				"supermaven-inc/supermaven-nvim",
				opts = {
					disable_inline_completion = true, -- disables inline completion for use with cmp
					disable_keymaps = true, -- disables built in keymaps for more manual control
				},
			},
			{
				"huijiro/blink-cmp-supermaven",
			},
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
				default = { "lsp", "path", "snippets", "buffer" },
				providers = {
					supermaven = {
						name = "supermaven",
						module = "blink-cmp-supermaven",
						async = true,
					},
				},
			},
		},
	},
}
