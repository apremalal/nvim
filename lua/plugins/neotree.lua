return {
	-- {
	-- 	"nvim-neo-tree/neo-tree.nvim",
	-- 	branch = "v3.x",
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 		"nvim-tree/nvim-web-devicons",
	-- 		"MunifTanjim/nui.nvim",
	-- 	},
	-- 	lazy = false,
	-- 	config = function()
	-- 		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})
	-- 		require("neo-tree").setup({
	-- 			enable_git_status = true,
	-- 			filesystem = {
	-- 				follow_current_file = {
	-- 					enabled = true, -- This will find and focus the file in the active buffer every time
	-- 					leave_dirs_open = true, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
	-- 				},
	-- 			},
	-- 			buffers = {
	-- 				follow_current_file = {
	-- 					enabled = true, -- This will find and focus the file in the active buffer every time
	-- 					leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
	-- 				},
	-- 			},
	-- 		})
	-- 	end,
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		lazy = false,
		config = function()
			vim.keymap.set("n", "<C-n>", ":NvimTreeFocus <CR>", {})
			require("nvim-tree").setup({
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
					ignore_list = {},
				},
				view = {
					width = 30,
					side = "left",
				},
			})
		end,
	},
}
