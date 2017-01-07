local lualit = require("lualit.lualit")

for parsed in lualit.lines_to_lua(io.lines()) do
  io.write(parsed)
end