return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        keys = {
          -- Example: disable "K" and add "gd" for definition
          { "K", false },
          -- { "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", has = "definition" },
        },
      },
    },
  },
}
