return {
  {
    "mrcjkb/rustaceanvim",
    version = "^9",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ["rust-analyzer"] = {
              rustfmt = {
                extraArgs = { "+nightly" },
              },
            },
          },
        },
      }
    end,
  },
}
