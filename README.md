# Lualit

**Lualit is literate programming for Lua**. It lets you write your Lua code as
a markdown file with a `.lualit` or `.lua.md` extension.

Indented text is treated as Lua code. Code can also be fenced with "\`\`\`lua",
[in the style of Github-flavored Markdown](https://help.github.com/articles/creating-and-highlighting-code-blocks/).
Everything else is treated as a comment.

Write code for humans first. Code is read more often than it is written. Lualit encourages self-documenting code through writing comments-first.
It's text-driven development!

## Using

Running via command line:

```bash
lualit path/to/file.lualit
```

You can also allow `.lualit` to be required from Lua by registering the loader plugin from within your Lua entry script:

```lua
require("lualit.register")
local my_lualit_module = require("my_lualit_module")
print(my_lualit_module.some_function())
```

This will will register a loader that will look for and run `.lualit` and
`.lua.md` files in your Lua path.

@TODO compiling to Lua from Lualit
@TODO compiling to Lualit from Lua

## Installing

@TODO

## Editor Support

Syntax highlighting support:

- [ ] Everywhere (via code fencing)
- [x] Vim: [gordonbrander/vim_lualit](github.com/gordonbrander/vim_lualit)
- [ ] SublimeText/TextMate
- [ ] Emacs
- [ ] Micro

## Thanks

Inspired by [Literate Coffeescript](https://github.com/jashkenas/coffeescript/issues/1786) and [Docco](https://jashkenas.github.io/docco/).