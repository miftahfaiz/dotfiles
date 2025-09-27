return {
	"https://github.com/tpope/vim-dadbod",
	dependencies = {
		{ "https://github.com/kristijanhusak/vim-dadbod-ui", lazy = true },
		{ "https://github.com/kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = { "DB", "DBUI", "DBUIToggle", "DBUIAddConnection" },
	keys = {
		{
			"<leader>db",
			"<cmd>:DBUIToggle<CR>",
			desc = "Open Dadbod-ui",
		},
	},
}
