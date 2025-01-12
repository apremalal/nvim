return {
	{
		"nvim-flutter/flutter-tools.nvim",
		lazy = false,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
			"saghen/blink.cmp",
		},
		config = function()
			-- local capabilities = require("blink.cmp").get_lsp_capabilities()
			-- local lspconfig = require("lspconfig")
			--
			-- lspconfig["dartls"].setup({ capabilities = capabilities })
			require("flutter-tools").setup({
				widget_guides = {
					enabled = true,
				},
				lsp = {
					color = { -- show the derived colours for dart variables
						enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
						background = true, -- highlight the background
						background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
						foreground = true, -- highlight the foreground
						virtual_text = true, -- show the highlight using virtual text
						virtual_text_str = "■", -- the virtual text character to highlight
					},
					-- see the link below for details on each option:
					-- https://github.com/dart-lang/sdk/blob/master/pkg/analysis_server/tool/lsp_spec/README.md#client-workspace-configuration
					settings = {
						showTodos = true,
						completeFunctionCalls = true,
						renameFilesWithClasses = "prompt", -- "always"
						enableSnippets = true,
						enableSdkFormatter = true,
						updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
					},
				},
			})
		end,
	},
}
