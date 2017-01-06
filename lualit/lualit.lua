local lualit = {}

local INDENTED_CODE_BLOCK = '^%s%s%s%s'
local FENCE_START = '^```+lua'
local FENCE_END = '^```+'
local COMMENT_BLOCK = '^--'

function lualit.line_to_lua(is_in_fence, line)
  if line == "" then
    return is_in_fence, "\n"
  elseif is_in_fence then
    if line:match(FENCE_END) then
      return false, ""
    else
      return true, line .. "\n"
    end
  elseif line:match(FENCE_START) then
    return true, ""
  elseif line:match(INDENTED_CODE_BLOCK) then
    return false, line:gsub(INDENTED_CODE_BLOCK, "", 1) .. "\n"
  else
    return false, "-- " .. line .. "\n"
  end
end

function lualit.line_to_lit(state, line)
  if line == "" then
    return ""
  elseif line:match(COMMENT_BLOCK) then
    return line:gsub(COMMENT_BLOCK, "", 1)
  else
    return "    " .. line
  end
end

function lualit.lit_to_lua_file()
  local is_in_fence = false
  for line in io.lines() do
    is_in_fence, parsed = lualit.line_to_lua(is_in_fence, line)
    io.write(parsed)
  end
end

function lualit.lua_to_lit_file()
  local is_in_fence = false
  for line in io.lines() do
    is_in_fence, parsed = lualit.line_to_lit(prev, line)
    io.write(parsed)
  end
end

-- Lualit module loader
function lualit.load_module()
  -- http://lua-users.org/wiki/LuaModulesLoader
end

function lualit.register_loader()
  table.insert(package.loaders, 2, lualit.load_module)
end

if TEST then
  -- local x = lualit.line_to_lua("", "What is the deal")
  -- print(x)
end

return lualit