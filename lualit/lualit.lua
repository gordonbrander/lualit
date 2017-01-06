-- # Lualit
--
-- Lualit is literate lua. Lualit lets you write your Lua as a markdown file
-- with a `.md` or `.lualit` extension.
--
-- Anything in a lua code fence is considered Lua code. All the other things are
-- treated as a comments.
--
--     This is a comment
--
--     ```lua
--     print("Hello from Lua.")
--     print("This is interpreted as Lua code.")
--     ```
--
-- Because the code is fenced, GitHub-flavored markdown parsers will even
-- color-code the code blocks nicely!
--
-- ## Implementation
--
-- This file is a valid lualit program.
--
-- Create a table to store our module in.
local lualit = {}

-- Define some patterns for identifying text tokens.
local FENCE_START = '^```+lua'
local FENCE_END = '^```+'
local COMMENT_BLOCK = '^%-%-%s?'

function lualit.line_to_lua(is_in_fence, line)
  if is_in_fence then
    if line:match(FENCE_END) then
      return false, ""
    else
      return true, line .. "\n"
    end
  else
    if line == "" then
      return is_in_fence, "\n"
    elseif line:match(FENCE_START) then
      return true, ""
    else
      return false, "-- " .. line .. "\n"
    end
  end
end

function lualit.line_to_lit(is_in_fence, line)
  if is_in_fence then
    if line == "" then
      return false, "```\n\n" .. line
    else
      return true, line .. "\n"
    end
  else
    if line == "" then
      return is_in_fence, "\n"
    elseif line:match(COMMENT_BLOCK) then
      return false, line:gsub(COMMENT_BLOCK, "", 1) .. "\n"
    else
      return true, "```lua\n" .. line .. "\n"
    end
  end
end

function lualit.lit_to_lua_file()
  local is_in_fence, parsed = false, ""
  for line in io.lines() do
    is_in_fence, parsed = lualit.line_to_lua(is_in_fence, line)
    io.write(parsed)
  end
end

function lualit.lua_to_lit_file()
  local is_in_fence, parsed = false, ""
  for line in io.lines() do
    is_in_fence, parsed = lualit.line_to_lit(is_in_fence, line)
    io.write(parsed)
  end
end

-- Lualit module loader. You can register this to be able to load `.lualit`
-- files directly with `require`.
function lualit.load_module()
  -- http://lua-users.org/wiki/LuaModulesLoader
end

-- Registers the module loader.
function lualit.register_loader()
  table.insert(package.loaders, 2, lualit.load_module)
end

if TEST then
  -- local x = lualit.line_to_lua("", "What is the deal")
  -- print(x)
end

return lualit