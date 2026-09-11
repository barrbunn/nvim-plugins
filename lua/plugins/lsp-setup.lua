return {
	-- Mason: installs and manages LSP servers, formatters, linters, etc.
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason LSP Config: installs the servers listed below and auto-enables
	-- them via `vim.lsp.enable()` (automatic_enable defaults to true).
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"pyright",
					"lua_ls",
					"bashls",
					"jsonls",
					"yamlls",
					"clangd",
					"terraformls",
					"dockerls",
					"docker_compose_language_service",
					"gopls",
					"ts_ls",
					"rust_analyzer",
					"pbls",
				},
			})
		end,
	},
}
