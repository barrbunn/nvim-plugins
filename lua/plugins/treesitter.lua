return {
	-- TreeSitter
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",

		-- install parsers async
		config = function()
			require("nvim-treesitter").install({
				"lua", "vim", "vimdoc", "query",
				"bash", "diff",
				"json", "yaml",
				"python",
				"javascript", "typescript",
				"markdown", "markdown_inline",
				"latex",
				"nginx",
				"hcl", "terraform",
				"dockerfile", "helm",
				"gitignore", "git_config", "git_rebase",
				"pem",
				"ssh_config",
				"proto",
				"make", "c", "cpp", "strace", "meson",
				"go", "gomod",
				"rust"
			})

			-- Per-file-type indentation and highlighting
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					if pcall(vim.treesitter.start) then
						vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end
				end,
			})

		end,

	},
	-- TreeSitter TextObjects
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		branch = "main",
		
		init = function()
			vim.g.no_plugin_maps = true
		end,

		config = function()
			require("nvim-treesitter-textobjects").setup({
				select = {
					lookahead = true, -- Automatically jump forward to text-object
				},
				move = {
					set_jumps = true, -- Set jumps in jumplist
				},
			})

			local ts_select = require("nvim-treesitter-textobjects.select")
			local ts_move = require("nvim-treesitter-textobjects.move")

			local select_maps = {
				["af"] = "@functoin.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner",
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
			}

			for lhs, capture in pairs(select_maps) do
				vim.keymap.set({"x", "o"}, lhs, function()
					ts_select.select_textobject(capture, "textobjects")
				end)
			end

			-- Setup move to next/prev text-object
			local move_maps = {
				["]m"] = { ts_move.goto_next_start, "@function.outer" },
				["]]"] = { ts_move.goto_next_start, "@class.outer" },

				["]M"] = { ts_move.goto_next_end, "@function.outer" },
				["]["] = { ts_move.goto_next_end, "@class.outer" },

				["[m"] = { ts_move.goto_previous_start, "@function.outer" },
				["[["] = { ts_move.goto_previous_start, "@class.outer" },

				["[M"] = { ts_move.goto_previous_end, "@function.outer" },
				["[]"] = { ts_move.goto_previous_end, "@class.outer" },
			}

			for lhs, spec in pairs(move_maps) do
				vim.keymap.set({ "n", "x", "o" }, lhs, function()
					spec[1](spec[2], "textobjects")
				end)
			end

		end,

	},
	-- Autotag
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
}
