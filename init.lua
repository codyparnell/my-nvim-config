-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

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

vim.api.nvim_set_keymap("n", "++", ":w<CR>", { noremap = true, silent = true })
