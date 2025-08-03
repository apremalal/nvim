return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-media-files.nvim",
			"debugloop/telescope-undo.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").setup({
				file_ignore_patterns = {
					"node_modules",
					".git",
					"dist",
					"build",
					"target",
					".idea",
					".vscode",
					".dart_tool",
					".warp",
					"bazel-bin",
					"bazel-dataworks",
					"bazel-out",
					"bazel-testlogs",
				},
				find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
				extensions = {
					undo = {
						use_delta = true,
						side_by_side = false,
					},
				},
			})
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			--  			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
			vim.keymap.set("n", "<leader>fs", builtin.builtin, {})
			vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Grep word under cursor" })
			vim.keymap.set("n", "<leader>fk", builtin.keymaps, {})
			vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume search" })
			vim.keymap.set("n", "<leader>fn", function()
				builtin.find_files({ cwd = "~/.config/nvim" })
			end, { desc = "Find nvim config" })
			require("plugins.telescope.grep").setup()
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		dependencies = {
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			-- This is your opts table
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							previewer = false,
							layout_strategy = "horizontal",

							layout_config = {
								horizontal = {},
							},
						}),
					},
					fzf = {
						fuzzy = true, -- false will only do exact matching
						override_generic_sorter = true, -- override the generic sorter
						override_file_sorter = true, -- override the file sorter
						case_mode = "smart_case", -- or "ignore_case" or "respect_case"
						-- the default case_mode is "smart_case"
					},
					media_files = {
						-- filetypes whitelist
						-- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
						filetypes = { "png", "webp", "jpg", "jpeg" },
						-- find command (defaults to `fd`)
						find_cmd = "rg",
					},
				},
				pickers = {
					lsp_code_actions = {
						theme = "cursor",
					},
					find_files = {
						-- no_ignore = true,
						hidden = true,
					},
				},
				defaults = {
					sorting_strategy = "ascending",
					layout_config = {
						prompt_position = "top",
					},
				},
			})
			-- To get ui-select loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require("telescope").load_extension("ui-select")
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("media_files")
		end,
	},
}
