return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
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
				"puppet",
				"terraformls",
				"yamlls",
			},
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
			},
		})

    lua_ls = { settings = { Lua = {
      workspace = {
        checkThirdParty = false,
        library = vim.tbl_deep_extend('force', vim.api.nvim_get_runtime_file("", true), {
          "${3rd}/luv/library",
          "${3rd}/busted/library",
          "/usr/share/awesome/lib",
          "/usr/share/lua",
        }),
      },
      diagnostics = {
        globals = {
          "awesome",
          "awful",
          "client",
          "screen",
          "tag",
          "root",
        },
      },
      runtime = { version = 'LuaJIT' },
      completion = { callSnippet = "Replace", },
      telemetry = { enable = false, },
    }}}

	end,
}
