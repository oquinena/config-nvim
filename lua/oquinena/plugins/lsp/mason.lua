return {
	"mason-org/mason.nvim",
	dependencies = {
		"mason-org/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			-- list of servers for mason to install
			ensure_installed = {
				"html",
				"bashls",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"pyright",
				"dockerls",
				"docker_compose_language_service",
				"gopls",
				"terraformls",
				"yamlls",
				"vtsls", -- typescript/javascript
				"eslint", -- js/ts linting (attaches only in projects with an eslint config)
				"ansiblels",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"shfmt", -- bash formatter
				"ansible-lint", -- used by ansiblels for playbook diagnostics
				"goimports", -- go import organizer
				"gofumpt", -- stricter gofmt
				"golangci-lint", -- go linter
				"gomodifytags", -- tool for go.nvim struct tags
				"impl", -- tool for go.nvim interface implementation
				"delve", -- go debugger
			},
		})
	end,
}
