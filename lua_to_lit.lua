local lualit = require("lualit.lualit")

for parsed in lualit.lines_to_lit(io.lines()) do
  io.write(parsed)
end