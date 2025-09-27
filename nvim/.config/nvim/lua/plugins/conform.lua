return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      html = { "prettierd" },
      css = { "prettierd" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettier" },
      lua = { "stylua" },
      php = { "pint" },
      blade = { "blade-formatter" },
      vue = { "prettierd" },
    },
  },
  keys = {
    {
      "<leader>gf",
      function()
	require("conform").format({
	  lsp_format = fallback,
	  timeout_ms = 1000,
	})
      end,
      desc = "Format",
    },
  },
}
