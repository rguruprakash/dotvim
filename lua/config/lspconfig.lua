local M = {}

local capabilities = require("cmp_nvim_lsp").default_capabilities() -- from nvim-cmp plugin

local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true }
	vim.keymap.set("n", "<space>e", require("telescope.builtin").diagnostics, opts)
	vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

	-- Enable completion triggered by <c-x><c-o>
	local builtin = require("telescope.builtin")
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", function()
		builtin.lsp_definitions({ show_line = false })
	end, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", function()
		builtin.lsp_implementations({ show_line = false })
	end, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", function()
		builtin.lsp_references({ show_line = false })
	end, {})
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = false })
	end, bufopts)
	vim.keymap.set("v", "<space>f", function()
		vim.lsp.buf.range_formatting({ async = true })
	end, bufopts)

	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
      autocmd CursorHold  <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()
      autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
    ]])
	end
end

function M.setup(use)
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	require("lspconfig").tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").gopls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").lua_ls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			Lua = {
				runtime = {
					-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
					version = "LuaJIT",
				},
				diagnostics = {
					-- Get the language server to recognize the `vim` global
					globals = { "vim" },
				},
				workspace = {
					-- Make the server aware of Neovim runtime files
					library = vim.api.nvim_get_runtime_file("", true),
				},
				-- Do not send telemetry data containing a randomized but unique identifier
				telemetry = {
					enable = false,
				},
			},
		},
	})
	require("lspconfig").pylsp.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").graphql.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").bashls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").yamlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		yaml = {
			schemas = {
				kubernetes = "*.yaml",
			},
		},
	})
	require("lspconfig").grammarly.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").docker_compose_language_service.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("lspconfig").dockerls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
	require("null-ls").setup({
		on_attach = on_attach,
		sources = {
			require("null-ls").builtins.formatting.pg_format,
			-- require("null-ls").builtins.formatting.jq,
			require("null-ls").builtins.formatting.beautysh,
			require("null-ls").builtins.formatting.prettier,
			require("null-ls").builtins.formatting.stylua,
			-- require("null-ls").builtins.diagnostics.revive
		},
	})
end

return M
