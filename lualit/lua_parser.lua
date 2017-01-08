local parser = {}

-- Quick and dirty way to transform a lua string to lualit string.
function parser.parse_to_lit(input_string)
  -- We retain the same number of lines after replacing.
  -- This aids with debugging, since lualit and lua file are 1:1, program
  -- errors will show correct line numbers.
  local output_string = input_string
    -- Indent code blocks (anything that doesn't start with "-")
    :gsub("^([^\n]+)", "    %1", 1)
    :gsub("\n([^%-\n]+)", "\n    %1")
    -- Un-comment any commented text at beginning of string
    :gsub("\n%-%-", "\n")
  return output_string
end

if TEST then
  local s = [[function foo()
  print('x')
end

-- Foo bar baz

-- baz bing bazang

for x in ipairs(y)
  x = x - x
end

-- bazoong bazong
-- bla
--
-- Bloo
]]
  print(parser.parse_to_lit(s))
end

return parser