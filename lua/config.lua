require("packer").startup({
  function(use)
    use("wbthomason/packer.nvim") -- Package manager
    use("simeji/winresizer")
    use({
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- optional configuration
        })
      end,
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      }
    })

    -- PRESERVE ORDER
    require("config.theme").setup(use)
    require("config.bufferline").setup(use)
    require("config.treesitter").setup(use)
    require("config.project").setup(use)
    require("config.telescope").setup(use)
    require("config.neodev").setup(use)
    require("config.lspconfig").setup(use)
    require("config.mason").setup(use)
    require("config.autocomplete").setup(use)
    require("config.git").setup(use)
    require("config.fold").setup(use)
    require("config.nvim-tree").setup(use)
    require("config.indent-blankline").setup(use)
    require("config.autopair").setup(use)
    require("config.dap").setup(use)
    require("config.symbol-outline").setup(use)
    require("config.trouble").setup(use)
    require("config.cheatsheet").setup(use)
    require("config.lualine").setup(use)
    require("config.notes").setup(use)
    require("config.mini").setup(use)
    require("config.todo-comments").setup(use)
    require("config.null-ls").setup(use)
  end,
  config = {
    display = {
      open_fn = require("packer.util").float,
    },
  },
})

-- vim.opt.numberwidth = 3
-- vim.opt.statuscolumn = "%=%{v:virtnum < 1 ? (v:relnum ? v:relnum : v:lnum < 10 ? v:lnum . '  ' : v:lnum) : ''}%=%s"

-- vim.cmd[[
--   let &stc='%#NonText#%{&nu?v:lnum:""}%=%{&rnu&&(v:lnum%2)?"\ ".v:relnum:""}%#LineNr#%{&rnu&&!(v:lnum%2)?"\ ".v:relnum:""}'
-- ]]
--
-- TODO:
-- Setup DAP for Go lang
-- Configure yamlls to validate k8s yaml
-- dont focus notify buffer
