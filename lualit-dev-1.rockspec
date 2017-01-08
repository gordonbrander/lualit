-- http://www.luarocks.org/en/Creating_a_rock
package = "lualit"
version = "dev-1"
source = {
  url = "git://github.com/gordonbrander/lualit"
}
description = {
  summary = "Literate programming for Lua",
  detailed = [[
  Lualit is literate programming for Lua. It lets you write your Lua code as
  a markdown file with a `.lualit` or `.lua.md` extension. Indented text is
  treated as Lua code. Everything else is treated as a comment.

  Lualit can be dynamically compiled and run using a loader plugin, or compiled
  into Lua and run at a later time.

  Lualit files get pretty syntax highlighting on GitHub (via `.lua.md`) and can
  be compiled to pretty documentation with
  Docco (https://jashkenas.github.io/docco/).
  ]],
  homepage = "https://github.com/gordonbrander/lualit",
  license = "MIT/X11"
}
dependencies = {
  "lua >= 5.1"
}
build = {
  type = "builtin",
  modules = {
    ["lualit.register"] = "lualit/register.lua",
    ["lualit.loader"] = "lualit/loader.lua",
    ["lualit.lit_parser"] = "lualit/lit_parser.lua"
  },
  install = {
    bin = {
      "bin/lualit",
      "bin/lit2lua"
    }
  }
}
