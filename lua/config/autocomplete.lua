local M = {}

function M.setup(use)
  -- snippet sources
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp

  -- completion sources
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("hrsh7th/cmp-buffer") -- Source for buffer words
  use("hrsh7th/cmp-path") -- Source for path
  -- use 'hrsh7th/cmp-nvim-lua' -- Source for nvim-lua

  use("L3MON4D3/LuaSnip") -- Snippets engine
  use({
    "hrsh7th/nvim-cmp", -- Autocompletion plugin
    config = function()
      vim.cmd([[
        set completeopt=menu,menuone,noselect
      ]])

      local luasnip = require("luasnip")
      local cmp = require("cmp")
      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "path" },
          -- { name = 'nvim_lua' }
        },
      })
    end,
  })
end

return M
