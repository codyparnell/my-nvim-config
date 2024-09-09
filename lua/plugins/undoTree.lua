return {
  {
    "mbbill/undotree",
    config = function()
      -- You can set custom keybindings or configurations here
      vim.keymap.set("n", "<leader>uu", ":UndotreeToggle<CR>", { noremap = true, silent = true })
    end,
  },
}
