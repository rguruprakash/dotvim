local M = {}

function M.setup(use)
  use({
    "neovim/nvim-lspconfig",
    config = function()
      local opts = { noremap = true, silent = true }
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>e", builtin.diagnostics, opts)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)

      local on_attach = function(client, bufnr)
        -- Enable completion triggered by <c-x><c-o>
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
        -- vim.keymap.set("v", "<space>f", function()
        --   vim.lsp.buf.range_formatting({ async = true })
        -- end, bufopts)

        if client.server_capabilities.documentHighlightProvider then
          vim.cmd([[
      hi! LspReferenceRead cterm=bold ctermbg=237 guibg=#45403d
      hi! LspReferenceText cterm=bold ctermbg=237 guibg=#45403d
      hi! LspReferenceWrite cterm=bold ctermbg=237 guibg=#45403d
    ]]     )
          vim.api.nvim_create_augroup("lsp_document_highlight", {
            clear = false,
          })
          vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = "lsp_document_highlight",
          })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end
      -- Add additional capabilities supported by nvim-cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      require("lspconfig")["tsserver"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig")["gopls"].setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig")["sumneko_lua"].setup({
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
      require("lspconfig").pyright.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      require("lspconfig").graphql.setup({
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
    end,
  })
end

return M
