# Lualit

**Lualit is literate programming for Lua**. It lets you write your Lua code as
a markdown file with a `.lualit` or `.lua.md` extension.

Code is read more often than it is written. Lualit encourages self-documenting
code by letting you write code for humans first. It's text-driven development!

Indented text is treated as Lua code. Code can also be fenced with "\`\`\`lua",
[in the style of Github-flavored Markdown](https://help.github.com/articles/creating-and-highlighting-code-blocks/).
Everything else is treated as a comment.

Lualit can be dynamically compiled and run using a loader plugin, or compiled
into Lua and run at a later time.

Because it compiles to Lua code, it's compatible with all existing Lua
libraries, as well as alternative Lua implementations like LuaJIT.

Bonus points: Lualit compiles to pretty documentation with
[Docco](https://github.com/rgieseke/locco).

## Using

Adding Lualit support is easy. Just `require("lualit.register")` and Lua will
know how to load and run any Lualit file.

```lua
require("lualit.register")
local my_lualit_module = require("my_lualit_module")
print(my_lualit_module.some_function())
```

This will will register a loader that will look for and run `.lualit` and
`.lua.md` files in your Lua path.

The Lualit loader will be careful to retain the same line numbers for code, so
so that errors will report correct line numbers.

Running a `.lualit` file directly is easy to:

```bash
lualit path/to/file.lualit
```

## Compiling `.lualit` to `.lua`

You can also compile Lualit to lua using the `lit2lua` command line utility.
`lit2lua` takes Lualit via `stdin` and returns valid lua via `stdout`.

Here's how to use it to compile a Lualit file:

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
- [ ] lua to Lualit? (This could be used for documentation?)

Note that static compilers don't have to keep line numbers... we only
need to care about that when converting at runtime.

## Thanks

Inspired by [Literate Coffeescript](https://github.com/jashkenas/coffeescript/issues/1786) and [Docco](https://jashkenas.github.io/docco/).