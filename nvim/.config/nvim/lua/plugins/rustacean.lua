return {
  {
    "mrcjkb/rustaceanvim",
    version = "^6",
    ft = { "rust" },
    init = function()
      vim.g.rustaceanvim = {
        server = {
          cmd = { "/opt/homebrew/bin/rust-analyzer" },
          on_attach = function(_, bufnr)
            local map = function(keys, func, desc)
              vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end
            map("<leader>ca", vim.lsp.buf.code_action, "Rust Code Action")
            map("<leader>rr", "<cmd>RustLsp runnables<CR>", "Rust Runnables")
          end,
        },
      }
    end,
  },
}
