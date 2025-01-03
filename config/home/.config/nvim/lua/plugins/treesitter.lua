return { -- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	config = function(_, opts)
		vim.filetype.add({
			extension = { rasi = "rasi" },
			pattern = {
				[".*/waybar/config"] = "jsonc",
				[".*/kitty/*.conf"] = "bash",
				[".*/hypr/.*%.conf"] = "hyprlang",
				[".*/hypr/.*/.*%.conf"] = "hyprlang",
			},
		})

		---@diagnostic disable-next-line: missing-fields
		require("nvim-treesitter.configs").setup(opts)
	end,
}
