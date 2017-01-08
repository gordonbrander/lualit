-- http://www.luarocks.org/en/Creating_a_rock
package = "lualit"
version = "dev-1"
source = {
  url = "git://github.com/gordonbrander/lualit"
}
description = {
  summary = "Literate programming for Lua",
  detailed = [[
  Lualit is literate programming for Lua. It lets you write your Lua as a
  markdown file with a `.lualit` extension.
  
  Indented is considered executable Lua code. Everything else is treated as
  comments.

  Write code for humans first!

  Code is read more often than it is written. Lualit encourages
  self-documenting code through writing comments-first.
  It's text-driven development!

  More:
  https://en.wikipedia.org/wiki/Literate_programming
  https://jashkenas.github.io/docco/
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
