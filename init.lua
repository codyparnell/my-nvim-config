-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Automatically install coc-spell-checker on startup
-- vim.cmd([[
--   autocmd VimEnter * if empty(glob('~/.config/coc/extensions/node_modules/coc-spell-checker')) | execute 'CocInstall coc-spell-checker' | endif
-- ]])

-- Automatically install coc-actions on startup
-- vim.cmd([[
--   autocmd VimEnter * if empty(glob('~/.config/coc/extensions/node_modules/coc-actions')) | execute 'CocInstall coc-actions' | endif
-- ]])

-- Set colorscheme to catppuccin
require("catppuccin").setup({
  float = {
    -- transparent = true,
    solid = false,
  },
  -- transparent_background = true,
})

-- vim.cmd([[colorscheme catppuccin]])
vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[TransparentEnable]])

vim.opt.breakindent = true

-- Set color ( these are colors for catppuccin, these will neeed to change if i use a different theme)
-- todo: make these react to the colorscheme
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "NONE", ctermbg = "NONE", fg = "#9399b2", ctermfg = "NONE", blend = 0 })
vim.api.nvim_set_hl(0, "CmpBorder", { bg = "NONE", fg = "#9399b2", blend = 0 })
vim.api.nvim_set_hl(0, "CmpBorderDocs", { bg = "NONE", fg = "#89b4fa", blend = 0 })

vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "NONE", fg = "#89b4fa", blend = 0 })

-- changing the cmp colors
local cmp = require("cmp")

-- Get the existing configuration
local current_config = cmp.get_config()

-- Merge new settings with the existing configuration
local new_config = {
  window = {
    border = "rounded",
    completion = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder",
    }, -- Enable border for completion window
    documentation = {
      border = "rounded",
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorderDocs", -- Removed trailing comma
    },
  },
}
-- Apply the merged configuration
cmp.setup(vim.tbl_deep_extend("force", current_config, new_config))

-- Set the background color to 'none' for the Mason LSP autocomplete menu
vim.api.nvim_set_hl(0, "CmpItemAbbr", { bg = "none" }) -- Foreground color can be adjusted as needed
vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemAbbrMatchFuzzy", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemKind", { bg = "none" })
vim.api.nvim_set_hl(0, "CmpItemMenu", { bg = "none" })
