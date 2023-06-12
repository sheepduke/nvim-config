return {
  --------------------------------------------------------------------
  {
    "j-morano/buffer_manager.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("buffer_manager.ui")
    end
  }
}
