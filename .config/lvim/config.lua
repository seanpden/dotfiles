-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- PLUGINS
lvim.builtin.dap.active = true

lvim.plugins = {
	{
		"catppuccin/nvim",
		name = "catppuccin",
	},
	{
		"max397574/better-escape.nvim",
		name = "better-escape",
	},
	{
		"Exafunction/codeium.vim",
		event = "BufEnter",
	},
	{
		"nvim-lua/plenary.nvim",
		name = "plenary",
	},
	-- {
	-- 	"scalameta/nvim-metals",
	-- 	name = "nvim-metals",
	-- 	filetypes = { "scala", "sbt" },
	-- 	opts = function()
	-- 		local metals_config = require("metals").bare_config()
	-- 		metals_config.on_attach = function(client, bufnr)
	-- 			-- your on_attach function
	-- 		end

	-- 		return metals_config
	-- 	end,
	-- 	config = function(self, metals_config)
	-- 		local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
	-- 		vim.api.nvim_create_autocmd("FileType", {
	-- 			pattern = self.ft,
	-- 			callback = function()
	-- 				require("metals").initialize_or_attach(metals_config)
	-- 			end,
	-- 			group = nvim_metals_group,
	-- 		})
	-- 	end,
	-- },
}

-- OPTS
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- COLORSCHEME
lvim.colorscheme = "catppuccin-macchiato"
lvim.transparent_window = true

-- KEYBINDING
lvim.keys.insert_mode["jj"] = "<esc>"
lvim.keys.insert_mode["jk"] = "<esc>"

-- FORMATTING
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "stylua", filetypes = { "lua" } },
	{ name = "black", filetypes = { "python" } },
	{ name = "gofumpt", filetypes = { "go" } },
	{ name = "beautysh", filetypes = { "sh" } },
	{ name = "rustfmt" },
})
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = { "*.rs", "*.py", "*.go", "*.lua", "*.sh" }

-- LINTING
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ name = "ruff" },
})

-- DAP
