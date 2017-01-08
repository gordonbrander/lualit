local lit = require("lualit.lit_parser")
local loader = require("lualit.loader")

-- Test against README
assert(loader.loadfile("fixtures/example.lua.md"))