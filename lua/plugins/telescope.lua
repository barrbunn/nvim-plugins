return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"jvgrootveld/telescope-zoxide"
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			vim.g.telescope_fzf_case_mode_index = 1
			vim.g.telescope_fzf_case_modes = {'smart_case', 'ignore_case', 'respect_case'}
			vim.g.telescope_fzf_case_mode = 'smart_case'

			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case"
					},
					layout_strategy = "vertical",
					sorting_strategy = "ascending",
					file_ignore_patterns = {
						"%.o",
						"%.git"
					},
					set_env = {
						["COLORTERM"] = "truecolor"
					},
				},
				pickers = {
					find_files = {
						find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
					}
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = vim.g.telescope_fzf_case_mode,
					},
				}
				
			})

			pcall(telescope.load_extension, "fzf")

			local builtin = require("telescope.builtin")
			local keymap = vim.keymap.set
			local opts = {noremap = true, silent = true}

			keymap("n", "<leader>ff", builtin.find_files, opts)
			keymap("n", "<leader>fg", builtin.live_grep, opts)
			keymap("n", "<leader>fb", builtin.buffers, opts)
			keymap("n", "<leader>fh", builtin.help_tags, opts)
			keymap("n", "<leader>fr", builtin.lsp_references, opts)
			keymap("n", "<leader>fs", builtin.lsp_document_symbols, opts)
			keymap("n", "<leader>fzx", "<cmd>Telescope zoxide list<CR>", { desc = "(Zoxide) Recent Folders" })

		end,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	}
}
