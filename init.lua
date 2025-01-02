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

-- makes rezsizing snappy
require("mini.animate").setup({
  resize = {
    enable = false,
  },
})

-- Set colorscheme to catppuccin
require("catppuccin").setup({
  transparent_background = true,
})

vim.cmd([[colorscheme catppuccin]])
-- vim.cmd([[TransparentEnable]])

vim.opt.breakindent = true

require("nvim-treesitter.configs").setup({
  ensure_installed = { "javascript", "markdown" }, -- Install all maintained parsers
  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  ignore_install = {}, -- List of parsers to ignore installing
  auto_install = true, -- Automatically install missing parsers when entering buffer
  highlight = {
    enable = true, -- Enable for all filetypes
    disable = { "plaintext", "text", "gitattributes" }, -- Disable for these filetypes
  },
  modules = {},
})

local cmp = require("cmp")

-- Get the existing configuration
local current_config = cmp.get_config()

-- Set color
vim.api.nvim_set_hl(0, "CmpNormal", { bg = "#0F111A", blend = 0 })
vim.api.nvim_set_hl(0, "CmpBorder", { bg = "#0F111A", fg = "#89b4fa", blend = 0 })

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
      winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder", -- Removed trailing comma
    },
  },
}

-- Apply the merged configuration
cmp.setup(vim.tbl_deep_extend("force", current_config, new_config))
