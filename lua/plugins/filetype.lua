return {
  --------------------------------------------------------------------
  -- Org mode.
  {
    "nvim-orgmode/orgmode",
    dependencies = {
      "nvim-treesitter/nvim-treesitter"
    },
    config = function()
      require('orgmode').setup {}
      require('orgmode').setup_ts_grammar()

      require("nvim-treesitter.configs").setup {
        highlight = {
          enable = true,
          -- Required for spellcheck, some LaTex highlights and
          -- code block highlights that do not have ts grammar
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = {
          "org",
          "rust"
        }, -- Or run :TSUpdate org
      }
    end
  }
}
