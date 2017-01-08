local lit = require("lualit.lit_parser")
local loader = require("lualit.loader")

-- Test against README
assert(loader.loadfile("README.md"))
-- Print it out so you can eyeball it.
print(lit.parse_to_lua(loader.read_all("README.md")))
