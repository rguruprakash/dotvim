local M = {}

function M.setup(use)
  use({
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      local on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set("n", "<space>f", function()
          vim.lsp.buf.format({ async = false })
        end, bufopts)
      end
      null_ls.setup({
        on_attach = on_attach,
        sources = {
          null_ls.builtins.formatting.pg_format,
          null_ls.builtins.formatting.jq,
          null_ls.builtins.formatting.beautysh
        },
      })
    end,
  })
end

return M
