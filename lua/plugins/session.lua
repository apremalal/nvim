return {
	"rmagatti/auto-session",
	config = function()
		local function close_neo_tree()
			require("neo-tree.sources.manager").close_all()
			vim.notify("closed all")
		end

		local function open_neo_tree()
			vim.notify("opening neotree")
			require("neo-tree.sources.manager").show("filesystem")
		end
		require("auto-session").setup({
			log_level = "error",
			auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
			pre_save_cmds = {
				close_neo_tree,
			},
			post_restore_cmds = {
				open_neo_tree,
			},
			session_lens = {
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
