local lit = {}

-- Quick and dirty way to transform a lualit string to lua string.
function lit.parse_to_lua(lit_string)
  -- Comment out any first line if it does not begin with a a space.
  -- Then comment out any line that does not begin with a space.
  -- We retain the same number of lines after replacing.
  -- This aids with debugging, since lualit and lua file are 1:1, program
  -- errors will show correct line numbers.
  local lua_string = lit_string
    -- Comment out any non-space text at beginning of lua string
    :gsub("^(%S)", "-- %1", 1)
    -- Comment any non-space text that occurs on a new line
    :gsub("(\n)(%S)", "%1-- %2")
    -- "Outdent" any indented text
    :gsub("\n    ", "\n")
  return lua_string
end

return lit