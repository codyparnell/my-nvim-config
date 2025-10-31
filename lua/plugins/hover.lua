return {
  "Fildo7525/pretty_hover",
  event = "LspAttach",
  opts = {},
  multi_server = true,
  config = function()
    vim.keymap.set("n", "K", function()
      require("pretty_hover").hover()
    end, { desc = "Pretty Hover" })
  end,
}
-- return {
--   "lewis6991/hover.nvim",
--   config = function()
--     require("hover").config({
--       providers = {
--         "hover.providers.diagnostic",
--         "hover.providers.lsp",
--         -- 'hover.providers.dap',
--         -- 'hover.providers.man',
--         -- 'hover.providers.dictionary',
--         -- 'hover.providers.gh',
--         -- 'hover.providers.gh_user',
--         -- 'hover.providers.jira',
--         -- 'hover.providers.fold_preview',
--         -- 'hover.providers.highlight',
--       },
--       preview_opts = {
--         border = "rounded",
--       },
--       preview_window = true,
--       title = true,
--       mouse_providers = {
--         "hover.providers.lsp",
--       },
--       mouse_delay = 1000,
--     })
--     -- Setup keymaps
--     vim.keymap.set("n", "K", function()
--       require("hover").open()
--     end, { desc = "hover.nvim (open)" })
--
--     vim.keymap.set("n", "gK", function()
--       require("hover").enter()
--     end, { desc = "hover.nvim (enter)" })
--
--     vim.keymap.set("n", "<C-p>", function()
--       require("hover").switch("previous")
--     end, { desc = "hover.nvim (previous source)" })
--
--     vim.keymap.set("n", "<C-n>", function()
--       require("hover").switch("next")
--     end, { desc = "hover.nvim (next source)" })
--
--     -- Mouse support
--     vim.keymap.set("n", "<MouseMove>", function()
--       require("hover").mouse()
--     end, { desc = "hover.nvim (mouse)" })
--
--     vim.o.mousemoveevent = true
--   end,
-- }
