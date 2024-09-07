-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- Automatically install coc-spell-checker on startup
vim.cmd([[
  autocmd VimEnter * if empty(glob('~/.config/coc/extensions/node_modules/coc-spell-checker')) | execute 'CocInstall coc-spell-checker' | endif
]])

-- Automatically install coc-actions on startup
vim.cmd([[
  autocmd VimEnter * if empty(glob('~/.config/coc/extensions/node_modules/coc-actions')) | execute 'CocInstall coc-actions' | endif
]])

-- copies ts type to the clipboard
vim.api.nvim_create_user_command("Ct", function()
  local params = vim.lsp.util.make_position_params()
  vim.lsp.buf_request(0, "textDocument/hover", params, function(_, result)
    if result and result.contents then
      local hover_text = ""

      -- Extract the hover text from the result
      if type(result.contents) == "string" then
        hover_text = result.contents
      elseif result.contents.kind == "plaintext" then
        hover_text = result.contents.value
      elseif type(result.contents) == "table" and result.contents[1] and result.contents[1].value then
        hover_text = result.contents[1].value
      end

      -- Use pattern matching to extract only the type information up to a return/line break
      local type_info = hover_text:match(": ([%w_%.<>%s,]+)")

      if type_info then
        -- Remove anything after the first return/line break
        type_info = type_info:match("^[^\r\n]*")

        vim.fn.setreg("+", type_info) -- Copy to system clipboard
        print("Type copied to clipboard: " .. type_info)
      else
        print("Failed to extract type information.")
      end
    else
      print("No type information available.")
    end
  end)
end, {})

-- add code action
-- require("null-ls").register({
--   name = "my-actions",
--   method = { require("null-ls").methods.CODE_ACTION },
--   filetypes = { "_all" },
--   generator = {
--     fn = function()
--       return {
--         {
--           title = 'add "hi mom"',
--           action = function()
--             local current_row = vim.api.nvim_win_get_cursor(0)[1]
--             vim.api.nvim_buf_set_lines(0, current_row, current_row, true, { "hi mom" })
--           end,
--         },
--       }
--     end,
--   },
-- })
