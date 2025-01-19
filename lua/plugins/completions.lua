return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},
	-- {
	-- 	"L3MON4D3/LuaSnip",
	-- 	-- follow latest release
	-- 	version = "v2.*", -- Use the latest major release
	-- 	-- install jsregexp (optional)
	-- 	build = "make install_jsregexp",
	-- 	event = "InsertEnter",
	-- 	dependencies = { "rafamadriz/friendly-snippets" },
	-- 	config = function()
	-- 		-- Load VSCode-style snippets
	-- 		require("luasnip.loaders.from_vscode").lazy_load()
	-- 		require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets" } })
	-- 		-- Optional: Configure LuaSnip
	-- 		require("luasnip").config.set_config({
	-- 			history = true,
	-- 			updateevents = "TextChanged,TextChangedI",
	-- 		})
	-- 	end,
	-- },
	{
		"github/copilot.vim",
		event = "InsertEnter",
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
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
