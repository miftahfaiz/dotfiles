return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {
		files = {
			-- exclude .git and node_modules explicitly
			cmd = "rg --files --hidden --glob '!.git/*' --glob '!node_modules/*'",
		},
		live_grep = {
			cmd = "rg --vimgrep --hidden --glob '!.git/*' --glob '!node_modules/*'",
		},
	},
	keys = {
		{
			"<leader>ff",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find files in Current Working Directory",
		},
		{
			"<leader>fg",
			function()
				require("fzf-lua").live_grep()
			end,
			desc = "Find by live grep in Current Working Directory",
		},
		{
			"<leader>fb",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find open buffers",
		},
		{
			"<leader>fw",
			function()
				require("fzf-lua").grep_cword()
			end,
			desc = "Find word under cursor",
		},
		{
			"<leader>fW",
			function()
				require("fzf-lua").grep_cWORD()
			end,
			desc = "Find WORD under cursor",
		},
		{
			"<leader>fd",
			function()
				require("fzf-lua").diagnostics_document()
			end,
			desc = "Find document diagnostics",
		},
		{
			"<leader>fk",
			function()
				require("fzf-lua").keymaps()
			end,
			desc = "Find keymaps",
		},
		{
			"<leader>fc",
			function()
				require("fzf-lua").colorschemes()
			end,
			desc = "Find colorscheme",
		},
	},
}
