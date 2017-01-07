-- # Lualit
--
-- Lualit is literate lua. It lets you write your Lua as a markdown file
-- with a `.lualit` extension.
--
-- Anything indented is considered Lua code. All the other things are
-- treated as a comments.
--
-- @TODO
--
-- * Make sure there is an empty line between text and indented blocks.
-- * Hardwrap comments at 80 chars when converting to lua
--
-- ## Implementation
--
-- This file is a valid lualit program.
--
-- Create a table to store our module in.
local lualit = {}

local INDENT = string.rep(" ", 4)
local INDENTED_CODE_BLOCK = '^%s%s%s%s'
local COMMENT_BLOCK = '^%-%-%s?'

local START_TOKEN = 0
local BLANK_TOKEN = 1
local COMMENT_TOKEN = 2
local CODE_TOKEN = 3

function lualit.line_to_lua(prev_token, line)
  if line == "" then
    return BLANK_TOKEN, "\n"
  elseif line:match(INDENTED_CODE_BLOCK) then
    return CODE_TOKEN, (line:gsub(INDENTED_CODE_BLOCK, "", 1) .. "\n")
  else
    return COMMENT_TOKEN, ("-- " .. line .. "\n")
  end
end

function lualit.line_to_lit(prev_token, line)
  if line == "" then
    return BLANK_TOKEN, "\n"
  elseif line:match(COMMENT_BLOCK) then
    return COMMENT_TOKEN, (line:gsub(COMMENT_BLOCK, "", 1) .. "\n")
  elseif prev_token == COMMENT_TOKEN then
    return CODE_TOKEN, ("\n" .. INDENT .. line .. "\n")
  else
    return CODE_TOKEN, (INDENT .. line .. "\n")
  end
end

function lualit.lines_to_lit(lines)
  local token, parsed = START_TOKEN, ""
  return function()
    for line in lines do
      token, parsed = lualit.line_to_lit(token, line)
      return parsed
    end    
  end
end

function lualit.lines_to_lua(lines)
  local token, parsed = START_TOKEN, ""
  return function()
    for line in lines do
      token, parsed = lualit.line_to_lua(token, line)
      return parsed
    end
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