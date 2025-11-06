
return {
  
  { "folke/lazy.nvim", version = "*" }, -- Lazyvim manages itself!

  -- Colorscheme
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000, -- Load first
    config = function()
      vim.cmd.colorscheme("rose-pine")
    end,
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end,
  },

  -- Status line, the thingie at the bottom
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "auto",
        },
      })
    end,
  },
   -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "nix", "css", "javascript", "html", 
  "markdown", "json", "yaml", "bash", "python", "hyprlang" },
        sync_install = false,
        auto_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
      })
    end,
  },

}
