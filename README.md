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

You can also allow `.lualit` to be required from Lua by registering the loader
plugin from within your Lua entry script:

```lua
require("lualit.register")
local my_lualit_module = require("my_lualit_module")
print(my_lualit_module.some_function())
```

This will will register a loader that will look for and run `.lualit` and
`.lua.md` files in your Lua path.

The lualit loader will be careful to retain the same line numbers for code, so
so that errors will report correct line numbers.

## Compiling `.lualit` to `.lua`

You can also compile lualit to lua using the `lit2lua` command line utility.
`lit2lua` takes lualit via `stdin` and returns valid lua via `stdout`.

Here's how to use it to compile a lualit file:

```bash
less -f "some_file.lua.md" | lit2lua
```

## Installing

@TODO

## Editor Support

Syntax highlighting support:

- [x] Markdown syntax highlighting (via code fences and Github-flavored Markdown)
- [x] Vim: [gordonbrander/vim_lualit](github.com/gordonbrander/vim_lualit)
- [ ] SublimeText/TextMate
- [ ] Emacs
- [ ] Micro

## @TODO

- [x] lualit to lua
- [x] Dynamic loader
- [ ] lualit format (wrap lines)
- [ ] lualit to lua, nicely formatted? (This could be used for distribution?)
- [ ] lua to lualit? (This could be used for documentation?)

Note that static compilers don't have to keep line numbers... we only
need to care about that when converting at runtime.

## Thanks

Inspired by [Literate Coffeescript](https://github.com/jashkenas/coffeescript/issues/1786) and [Docco](https://jashkenas.github.io/docco/).