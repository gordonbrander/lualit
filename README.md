# Lualit

**Lualit is literate programming for Lua**. It lets you write your Lua code as
a markdown file with a `.lualit` or `.lua.md` extension. Indented text is
treated as Lua code. Everything else is treated as a comment.
See an example: [example.lua.md](https://github.com/gordonbrander/lualit/blob/master/fixtures/example.lua.md)

Lualit files get pretty syntax highlighting on GitHub (via `.lua.md`) and can
be compiled to pretty documentation with
[Docco](https://jashkenas.github.io/docco/).

Code is read more often than it is written. Lualit encourages self-documenting
code by letting you write code for humans first. It's text-driven development!

## Installing

To install with [Luarocks](https://luarocks.org/):

    luarocks install lualit

You can also just download the files and use them directly.

## Using

Adding Lualit support is easy. Just `require("lualit.register")` and Lua will
know how to load and run any Lualit file.

```lua
require("lualit.register")
local my_lualit_module = require("my_lualit_module")
print(my_lualit_module.some_function())
```

This will will register a loader that will look for and run `.lualit` and
`.lua.md` files in your Lua path. The Lualit loader will be careful to retain
the same line numbers for code, so so that errors will report correct
line numbers.

Running a `.lualit` file directly is also easy:

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

## Documentation with Docco

You can generate pretty documentation pages from your Lualit files using
[Docco](https://github.com/jashkenas/docco). Just install `docco`:

```bash
npm install -g docco
```

And run it on your Lualit files:

```bash
docco path/to/file.lua.md
```

## Editor Support

Syntax highlighting support:

- [x] Vim: [gordonbrander/vim_lualit](github.com/gordonbrander/vim_lualit)
- [ ] SublimeText/TextMate
- [ ] Emacs
- [ ] Micro

## @TODO

- [x] lualit to lua
- [x] Dynamic loader
- [x] Docco compatibility

Maybe:

- [ ] lualit format (wrap lines)
- [ ] `lit2lua --nice` nicely formatted Lua (wraps lines, etc). This could be useful for distribution. But it wouldn't retain line numbers.
- [ ] lua to lualit

## Thanks

Inspired by [Literate Coffeescript](https://github.com/jashkenas/coffeescript/issues/1786) and [Docco](https://jashkenas.github.io/docco/).