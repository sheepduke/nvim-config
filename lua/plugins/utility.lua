return {
  --------------------------------------------------------------------
  -- Automatically creates parent directory when saving a file.
  "jghauser/mkdir.nvim",

  --------------------------------------------------------------------
  -- Save as sudo.
  "lambdalisue/suda.vim",

  --------------------------------------------------------------------
  -- Automatically close pairs.
  {
    "jiangmiao/auto-pairs",
    config = function()
      vim.api.nvim_set_var("AutoPairsFlyMode", 1)
    end
  },
  --------------------------------------------------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate"
  },
  --------------------------------------------------------------------
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      require("spectre").setup()
    end
  }
}
