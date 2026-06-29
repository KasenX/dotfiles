return {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    -- Map leader+gg to open Lazygit
    vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>", { silent = true })
  end,
}
