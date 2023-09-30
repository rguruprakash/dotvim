local M = {}

function M.setup(use)
  -- snippet sources
  use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
  require("luasnip/loaders/from_lua").lazy_load()

  use("rafamadriz/friendly-snippets")
  require("luasnip/loaders/from_vscode").lazy_load()

  -- Snippets engine
  use("L3MON4D3/LuaSnip")

  -- completion sources
  use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
  use("hrsh7th/cmp-buffer")  -- Source for buffer words
  use("hrsh7th/cmp-path")    -- Source for path
  use("hrsh7th/cmp-nvim-lua") -- Source for nvim-lua

  -- LSP Icon
  use("onsails/lspkind.nvim")

  -- Autocompletion plugin
  use({
    "hrsh7th/nvim-cmp",
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
        experimental = {
          ghost_text = true,
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text", -- show only symbol annotations
            maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
            ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
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
          { name = "nvim_lsp",                priority = 1000 },
          { name = "nvim_lsp_signature_help", priority = 900 },
          { name = "luasnip",                 priority = 800 },
          { name = "buffer",                  priority = 700 },
          { name = "path",                    priority = 600 },
          { name = "nvim_lua",                priority = 500 },
        },
      })
    end,
  })
end

return M
