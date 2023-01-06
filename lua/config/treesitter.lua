local M = {}

function M.setup(use)
  -- There are some issues with installing treesitter with packer. so using vim-plug to load the plugin
  -- see: https://github.com/nvim-treesitter/nvim-treesitter/wiki/Installation
  use({
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup({})
    end,
  })
end

--/** TREE SITTER SETUP **/--
require("nvim-treesitter.configs").setup({
  -- A list of parser names, or "all"
  ensure_installed = { "go", "lua", "typescript", "javascript", "python", "scala", "json", "http" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
})

return M
