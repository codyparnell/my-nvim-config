local uname = vim.loop.os_uname()
local is_windows = uname.sysname == "Windows_NT"
local is_wsl = uname.release:lower():find("microsoft") ~= nil

local incr_key
if is_windows or is_wsl then
  incr_key = "<F8>"
else
  incr_key = "<C-Space>"
end

return {
  {
    "daliusd/incr.nvim",
    config = true,
    opts = {
      incr_key = incr_key, -- increment selection key
      decr_key = "<bs>", -- decrement selection key
    },
  },
}
