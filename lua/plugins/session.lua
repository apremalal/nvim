return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionSearch<CR>", desc = "Session search" },
		{ "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Toggle autosave" },
	},
	---enables autocomplete for opts
	---@module "auto-session"
	---@type AutoSession.Config
	config = function()
		local function close_neo_tree()
			-- local nvim_tree_api = require("nvim-tree.api")
			-- nvim_tree_api.tree.close()
		end

		local function open_neo_tree()
			-- vim.notify("opening neotree")
			-- require("neo-tree.sources.manager").show("filesystem")
			local nvim_tree_api = require("nvim-tree.api")
			nvim_tree_api.tree.open()
			nvim_tree_api.tree.change_root(vim.fn.getcwd())
			nvim_tree_api.tree.reload()
		end
		require("auto-session").setup({
			log_level = "warning",
			auto_save = true,
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			pre_save_cmds = {
				close_neo_tree,
			},
			post_restore_cmds = {
				open_neo_tree,
			},
			session_lens = {
				load_on_setup = true,
				buftypes_to_ignore = {},
				load_on_setup = true,
				theme_conf = { border = true },
				previewer = false,
			},
			vim.keymap.set(
				"n",
				"<leader>ls",
				require("auto-session.session-lens").search_session,
				{ noremap = true, silent = true }
			),
		})
	end,
}
