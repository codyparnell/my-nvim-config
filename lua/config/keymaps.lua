-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--  spell check bindings
vim.api.nvim_set_keymap(
  "v",
  "<leader>c",
  "<Plug>(coc-codeaction-selected)",
  { noremap = true, silent = true, desc = "spell check" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>c",
  "<Plug>(coc-codeaction-selected)",
  { noremap = true, silent = true, desc = "spell check" }
)

-- better saving
vim.api.nvim_set_keymap("n", "++", ":w<CR>", { noremap = true, silent = true })

-- better saving
vim.api.nvim_set_keymap("n", "++", ":w<CR>", { noremap = true, silent = true })

-- vim.api.nvim_set_keymap("n", "<leader>aa", ":CodeCompanionToggle<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<leader>aa", ":CodeCompanionToggle<CR>", { noremap = true, silent = true })
