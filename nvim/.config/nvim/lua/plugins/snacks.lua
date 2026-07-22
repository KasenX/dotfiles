return {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    picker = {
      sources = {
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
        explorer = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
}
