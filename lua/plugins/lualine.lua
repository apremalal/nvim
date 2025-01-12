return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
			options = {
				theme = "dracula",
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = { "branch" },
				lualine_c = {
					{
						path = 1,
						"filename",
						symbols = {
							modified = "●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_x = {},
				lualine_z = {},
			},
			winbar = {
				lualine_a = {},
				lualine_b = { "branch" },
				lualine_c = {
					{
						path = 1,
						"filename",
						symbols = {
							modified = "●", -- Text to show when the buffer is modified
							alternate_file = "#", -- Text to show to identify the alternate file
							directory = "", -- Text to show when the buffer is a directory
						},
					},
				},
				lualine_x = {},
				lualine_z = {},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
