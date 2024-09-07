return {
  -- Ensure coc.nvim is installed
  {
    "neoclide/coc.nvim",
    branch = "release",
    -- Add coc-spell-checker as an extension
    build = function()
      vim.cmd([[CocInstall coc-spell-checker]])
    end,
  },
}
