local stringtools = {}

function stringtools.iter_by_lines(s)
  return s:gmatch("[^\n]*")
end

-- Pad (indent) a string (but only the non-blank lines of the string)
function stringtools.pad(s, padding)
  local indented = ""
  for line in stringtools.iter_by_lines(s) do
    if line == "" then
      indented = indented
    else
      indented = indented .. padding .. line .. "\n"
    end
  end
  return indented
end

return stringtools