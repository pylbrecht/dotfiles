require('nvim-treesitter.configs').setup({
  -- gladfully taken from
  -- https://github.com/gennaro-tedesco/dotfiles/blob/b18fd749d6eb17fc4a57ea09cb074b9a203b1e28/nvim/lua/plugins/treesitter.lua#L25-L64
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = { query = "@function.outer", desc = "select around function" },
				["if"] = { query = "@function.inner", desc = "select inside function" },
				["ac"] = { query = "@class.outer", desc = "select around class" },
				["ic"] = { query = "@class.inner", desc = "select inside class" },
				["al"] = { query = "@loop.outer", desc = "select around loop" },
				["il"] = { query = "@loop.inner", desc = "select inside loop" },
				["ab"] = { query = "@block.outer", desc = "select around block" },
				["ib"] = { query = "@block.inner", desc = "select inside block" },
			},
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]f"] = { query = "@function.outer", desc = "go to next function" },
				["]c"] = { query = "@class.outer", desc = "go to next class" },
				["]l"] = { query = "@loop.outer", desc = "go to next loop" },
			},
      goto_next_end = {
				["]F"] = { query = "@function.outer", desc = "go to end of next function" },
				["]C"] = { query = "@class.outer", desc = "go to end of next class" },
				["]L"] = { query = "@loop.outer", desc = "go to end of next loop end" },
      },
			goto_previous_start = {
				["[f"] = { query = "@function.outer", desc = "go to previous function" },
				["[c"] = { query = "@class.outer", desc = "go to previous class" },
				["[l"] = { query = "@loop.outer", desc = "go to previous loop" },
			},
      goto_previous_end = {
				["[F"] = { query = "@function.outer", desc = "go to end of previous function" },
				["[C"] = { query = "@class.outer", desc = "go to end of previous class" },
				["[L"] = { query = "@loop.outer", desc = "go to end of previous loop" },
      }
		},
		lsp_interop = {
			enable = true,
			border = "rounded",
			peek_definition_code = {
				["gp"] = { query = "@function.outer", desc = "peek function definition" },
				["gcp"] = { query = "@class.outer", desc = "peek class definition" },
			},
		},
	},
})

local ts_repeat_move = require "nvim-treesitter.textobjects.repeatable_move"

-- vim way: ; goes to the direction you were moving.
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
