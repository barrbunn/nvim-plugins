return {
	-- Mason LSP Manager
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- Mason LSP Config
	{
		"mason-org/mason-lspconfig.nvim",

		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},

		config = function()
			require("mason-lspconfig").setup({
				automatic_installation = true
			})
		end,

		vim.lsp.enable({
			"pyright",
			"pyrefly",
			"lua_ls",
			"bashls",
			"jsonls",
			"yamlls",
			"clangd",
			"jq",
			"terraformls",
			"dockerls",
			"docker_language_server",
			"docker_compose_language_server",
			"gopls",
			"gotests",
			"goimports",
			"go-debug-adapter",
			"typescript-language-server",
			"rust-analyzer",
			"chrome-debug-adapter",
			"pbls"
		}),

		vim.diagnostic.config({ virtual_text = true })
	},
}
