local function detect_os()
  local raw_os_name, raw_arch_name = "", ""

  -- LuaJIT shortcut
  if jit and jit.os then
    return jit.os
  end

  -- Check the `package.config` variable
  raw_os_name = package.config:sub(1, 1)
  if raw_os_name == "\\" then
    return "Windows"
  else
    -- Check for UNIX-like OS
    local handle = io.popen("uname -s")
    raw_os_name = handle:read("*l")
    handle:close()

    if raw_os_name == "Linux" then
      return "Linux"
    elseif raw_os_name == "Darwin" then
      return "MacOS"
    elseif raw_os_name and raw_os_name:find("BSD") then
      return "BSD"
    else
      return "Unknown"
    end
  end
end

local os_name = detect_os()

if os_name == "Windows" or os_name == "Linux" or os_name == "WSL" then
  return {
    {
      "nvim-treesitter/nvim-treesitter",
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<F8>",
          node_incremental = "<F8>",
        },
      },
      lazy = false,
      branch = "main",
      build = ":TSUpdate",
      opts = {
        incremental_selection = {
          keymaps = {
            init_selection = "<F8>",
            node_incremental = "<F8>",
          },
        },
      },
    },
  }
else
  return {}
end
