return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ansiblels",
					"bashls",
					"clangd",
					"cmake",
					"cssls",
					"gopls",
					"html",
					"jsonls",
					"ts_ls",
					"pylsp",
					"terraformls",
					"yamlls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ansiblels", {
				capabilities = capabilities,
			})
			vim.lsp.config("bashls", {
				capabilities = capabilities,
			})
			vim.lsp.config("clangd", {
				capabilities = capabilities,
			})
			vim.lsp.config("cmake", {
				capabilities = capabilities,
			})
			vim.lsp.config("cssls", {
				capabilities = capabilities,
			})
			vim.lsp.config("gopls", {
				capabilities = capabilities,
			})
			vim.lsp.config("html", {
				capabilities = capabilities,
			})
			vim.lsp.config("jsonls", {
				capabilities = capabilities,
			})
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			vim.lsp.config("pylsp", {
				capabilities = capabilities,
			})
			vim.lsp.config("ruff", {
				capabilities = capabilities,
			})
			vim.lsp.config("terraformls", {
				capabilities = capabilities,
			})
			vim.lsp.config("yamlls", {
				capabilities = capabilities,
				schemas = {
					kubernetes = "*.yaml",
					["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
					["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
					["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
					["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
					["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
					["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
					["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
					["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
					["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
					["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
					["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
					["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
				}
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "C-k", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
