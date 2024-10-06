-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

-- PLUGINS
lvim.builtin.dap.active = true

lvim.plugins = {
	{
		"michaelrommel/nvim-silicon",
		lazy = true,
		cmd = "Silicon",
		init = function()
			local wk = require("which-key")
			wk.register({
				["<leader>sc"] = { ":Silicon<CR>", "Snapshot Code" },
			}, { mode = "v" })
		end,
		config = function()
			require("silicon").setup({
				-- Configuration here, or leave empty to use defaults
				font = "JetBrainsMono-Regular=34;Noto Color Emoji=34",
				theme = "Dracula",
				background = "#94e2d5",
				window_title = function()
					return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()), ":t")
				end,
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
			})
		end,
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
}

-- OPTS
vim.opt.relativenumber = true
vim.opt.scrolloff = 8

-- COLORSCHEME
lvim.colorscheme = "catppuccin"
lvim.transparent_window = true

-- KEYBINDING
lvim.keys.insert_mode["jj"] = "<esc>"
lvim.keys.insert_mode["jk"] = "<esc>"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.builtin.which_key.mappings["W"] = {
	name = "Window",
	v = { ":vsplit<CR>", "Vertical Split" },
	h = { ":split<CR>", "Horizontal Split" },
	c = { ":q<CR>", "Quit" },
}

-- FORMATTING
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ name = "stylua", filetypes = { "lua" } },
	{ name = "black", filetypes = { "python" } },
	{ name = "google_java_format", filetypes = { "java" } },
	{ name = "xmlformat", filetypes = { "xml" } },
	{ name = "gofumpt", filetypes = { "go" } },
	{ name = "beautysh", filetypes = { "sh" } },
	{ name = "rustfmt" },
	{
		name = "prettier",
		filetypes = { "html", "svelte" },
	},
})
lvim.format_on_save.enabled = true
lvim.format_on_save.pattern =
	{ "*.rs", "*.py", "*.go", "*.lua", "*.sh", "*.html", "*.svelte", "*.java", "*.xml", "*.c", "*.cpp" }

-- LINTING
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ name = "ruff", filetypes = { "python" } },
	{ name = "cpplint", filetypes = { "c", "cpp" } },
	{ name = "checkstyle", filetypes = { "java" }, extra_args = { "-c", "/google_checks.xml" } },
})

-- DAP
