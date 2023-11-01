local palette = require("ui.palette")
local tw = palette.tailwind

local black = tw.black
local bluegrey = tw.gray["800"]
local blue = tw.blue["700"]
local cyan = tw.cyan["400"]
local dark1 = tw.stone["950"]
local darkergrey = tw.stone["900"]
local darkestgrey = tw.stone["800"]
local darkgrey = tw.stone["700"]
local darkorange = tw.orange["800"]
local dimmed1 = tw.neutral["500"]
local dimmed2 = tw.neutral["600"]
local dimmed3 = tw.neutral["700"]
local dirtywhite = tw.neutral["200"]
local green = tw.blue["400"]
local leaf = tw.lime["500"]
local lightgrey = tw.gray["300"]
local magenta = tw.fuchsia["400"]
local orange = tw.orange["500"]
local pink = tw.pink["500"]
local purple = tw.purple["500"]
local red = tw.pink["400"]
local sky = tw.sky["500"]
local teal = tw.teal["500"]
local white = tw.white
local yellow = tw.yellow["500"]

local sideBar = {
  background = dark1,
  foreground = dimmed2,
}

local styles = {
  comment = { italic = true },
  keyword = { italic = true }, -- any other keyword
  type = { italic = true }, -- (preferred) int, long, char, etc
  storageclass = { italic = true }, -- static, register, volatile, etc
  structure = { italic = true }, -- struct, union, enum, etc
  parameter = { italic = true }, -- parameter pass in function
  annotation = { italic = true },
  tag_attribute = { italic = true }, -- attribute of tag in reactjs, html, etc...
}
local semantic_tokens = {

  -- type
  ["@lsp.type.class"] = { link = "Structure" },
  ["@lsp.type.decorator"] = { link = "Function" },
  ["@lsp.type.enum"] = { link = "Structure" },
  ["@lsp.type.enumNumber"] = { link = "Constant" },
  ["@lsp.type.function"] = { link = "Function" },
  ["@lsp.type.interface"] = { link = "Structure" },
  ["@lsp.type.macro"] = { link = "Macro" },
  ["@lsp.type.method"] = { link = "Function" },
  ["@lsp.type.namespace"] = { link = "Identifier" },
  ["@lsp.type.parameter"] = { link = "Identifier" },
  ["@lsp.type.property"] = { link = "Identifier" },
  ["@lsp.type.struct"] = { link = "Structure" },
  ["@lsp.type.type"] = { link = "Type" },
  ["@lsp.type.typeParameter"] = { link = "TypeDef" },
  ["@lsp.type.variable"] = { link = "Identifier" },

  -- mod
  -- ["@lsp.mod.declaration"] = { fg = cyan },
  -- ["@lsp.mod.definition"] = { fg = cyan },
  -- ["@lsp.mod.readonly"] = { fg = magenta },
  -- ["@lsp.mod.static"] = {},
  ["@lsp.mod.deprecated"] = { strikethrough = true },
  -- ["@lsp.mod.abstract"] = {},
  -- ["@lsp.mod.async"] = {},
  -- ["@lsp.mod.modification"] = {},
  -- ["@lsp.mod.documentation"] = {},
  -- ["@lsp.mod.defaultLibrary"] = {},

  ["@lsp.typemod.class.defaultLibrary"] = { fg = white },
  -- ["@lsp.typemod.decorator"] = {},
  -- ["@lsp.typemod.enum"] = {},
  -- ["@lsp.typemod.enumNumber"] = {},
  ["@lsp.typemod.function.declaration"] = { fg = green },
  ["@lsp.typemod.function.defaultLibrary"] = { fg = blue },
  -- ["@lsp.typemod.interface"] = {},
  -- ["@lsp.typemod.macro"] = {},
  -- ["@lsp.typemod.method"] = {},
  -- ["@lsp.typemod.namespace"] = {},
  ["@lsp.typemod.parameter.declaration"] = { fg = blue, italic = styles.parameter.italic },
  -- ["@lsp.typemod.property"] = {},
  -- ["@lsp.typemod.struct"] = {},
  -- ["@lsp.typemod.type"] = {},
  -- ["@lsp.typemod.typeParameter"] = {},
  ["@lsp.typemod.variable.readonly"] = { fg = magenta },
}

local treesitter = {
  ["@include"] = { fg = red }, -- `import`
  ["@variable"] = { fg = white },
  ["@punctuation.delimiter"] = { fg = dimmed2 }, -- `;`
  ["@punctuation.bracket"] = { fg = dimmed2 }, -- `(`
  ["@constructor"] = { fg = red }, -- `StrictMode` in `<React.StrictMode>`
  ["@tag.delimiter"] = { fg = dimmed2 }, -- `<`, `>` in `<div>`
  ["@operator"] = { fg = red }, -- `=`, `=>`
  ["@keyword"] = { fg = cyan, italic = styles.keyword.italic }, -- `const`, `export`, `default`
  ["@parameter"] = { fg = white },
  ["@string.documentation"] = { fg = dimmed3 },
  ["@type.builtin"] = { fg = cyan },
  ["@_isinstance"] = { fg = green },

  ["@keyword.return"] = { fg = red },
  ["@keyword.operator"] = { fg = red },
  ["@method.call"] = { fg = green },
  ["@property"] = { fg = white },
  ["@function"] = { fg = green },
  ["@constant.builtin"] = { fg = magenta },
  ["@tag"] = { fg = red },
  ["@tag.attribute"] = { fg = cyan, italic = styles.tag_attribute.italic },
  ["@attribute"] = { fg = cyan },
  ["@conditional"] = { fg = red },
  ["@repeat"] = { fg = red },
  ["@keyword.function"] = { fg = cyan, bold = true, italic = styles.keyword.italic },
  ["@number"] = { fg = magenta },
  ["@boolean"] = { fg = magenta },
  ["@type.qualifier"] = { fg = red, italic = styles.type.italic },
  ["@annotation"] = { fg = cyan, italic = styles.annotation.italic },
  ["@field"] = { fg = red },
  -- scss
  ["@keyword.scss"] = { fg = red },
  ["@function.scss"] = { fg = cyan },
  ["@property.scss"] = { fg = green },
  ["@string.scss"] = { fg = blue, italic = true },
  ["@number.scss"] = { fg = magenta },
  ["@type.scss"] = { fg = cyan },
  -- cpp
  ["@keyword.cpp"] = { fg = cyan, italic = styles.keyword.italic },
  ["@namespace.cpp"] = { fg = white },
  ["@operator.cpp"] = { fg = red },
  ["@type.cpp"] = { fg = blue, italic = styles.type.italic },
  ["@variable.cpp"] = { fg = white },
  ["@constant.cpp"] = { fg = cyan },
  ["@constant.macro.cpp"] = { fg = red },
  ["@punctuation.delimiter.cpp"] = { fg = sideBar.foreground },
  -- python
  ["@type.python"] = { fg = white },
  ["@keyword.python"] = { fg = cyan, italic = styles.keyword.italic },
  ["@variable.builtin.python"] = {
    fg = dimmed1,
    italic = true,
  },
  ["@field.python"] = { fg = white },
  ["@variable.python"] = { fg = white },
  ["@constructor.python"] = { fg = green },
  ["@method.python"] = { fg = green },
  ["@function.builtin.python"] = { fg = cyan, italic = true },
  ["@exception.python"] = { fg = red, italic = true },
  ["@constant.python"] = { fg = magenta },
  ["@keyword.function.python"] = { fg = cyan, italic = styles.keyword.italic },
  ["@operator.python"] = { fg = red },
  ["@varibale.builtin.python"] = { fg = blue, italic = true },
  ["@parameter.python"] = { fg = blue, italic = true },
  -- lua
  ["@variable.lua"] = { fg = white },
  ["@function.builtin.lua"] = { fg = green },
  ["@field.lua"] = { fg = white },
  ["@keyword.lua"] = { fg = red, italic = styles.keyword.italic },
  ["@keyword.function.lua"] = { fg = red },
  ["@conditional.lua"] = { fg = red },
  ["@namespace.lua"] = { fg = red },
  ["@comment.documentation.lua"] = { fg = cyan },
  ["@parameter.lua"] = { fg = blue, italic = true },
  -- latex
  ["@text.environment.latex"] = { fg = green },
  ["@text.environment.name.latex"] = { fg = blue, italic = true },
  ["@punctuation.special.latex"] = { fg = red },
  ["@text.math.latex"] = { fg = magenta },
  ["@text.strong.latex"] = { bold = true },
  ["@text.emphasis.latex"] = { italic = true },
  ["@string.latex"] = { fg = cyan },
  ["@function.macro.latex"] = { fg = green },
  -- Dockerfile
  ["@keyword.dockerfile"] = { fg = red },
  ["@lsp.type.class.dockerfile"] = { fg = cyan },
  ["@function.call.bash"] = { fg = green },
  ["@parameter.bash"] = { fg = white },
}

local theme = {
  accent1 = red,
  accent2 = orange,
  accent3 = yellow,
  accent4 = green,
  accent5 = sky,
  background = darkestgrey,
  black = black,
  blue = blue,
  boolean = magenta,
  character = magenta,
  comment = darkgrey,
  conditional = pink,
  constant = pink,
  cyan = cyan,
  dark1 = dark1,
  dark2 = black,
  dark = black,
  dark_orange = darkorange,
  define = red,
  delimiter = white,
  dimmed1 = lightgrey,
  dimmed2 = dimmed2, -- border
  dimmed3 = darkgrey,
  dimmed4 = bluegrey,
  dimmed5 = darkergrey,
  exc = red,
  float = magenta,
  func = green,
  green = green,
  identifier = orange,
  include = red,
  kword = red,
  label = red,
  leaf = leaf,
  macro = red,
  magenta = magenta,
  number = magenta,
  op = red,
  orange = orange,
  peat = red,
  pink = pink,
  precondit = red,
  preproc = yellow,
  purple = purple,
  red = red,
  sideBar = sideBar,
  sky = sky,
  specialchar = cyan,
  specialcomment = darkgrey,
  special = cyan,
  statement = red,
  storageclass = pink,
  structure = cyan,
  str = yellow,
  styles = styles,
  teal = teal,
  text = dirtywhite,
  todo = pink,
  type = blue,
  typedef = pink,
  white = white,
  yellow = yellow,
}

theme.treesitter = treesitter
theme.semantic_tokens = semantic_tokens

return theme
-- local palette = require("_oml.theme-daddy.colorscheme.palette")
-- local tw = palette.tailwind
--
-- local black = palette.black
-- local bluegrey = tw.gray["800"]
-- local blue = tw.blue["700"]
-- local cyan = tw.cyan["400"]
-- local dark1 = tw.stone["950"]
-- local darkergrey = tw.stone["900"]
-- local darkestgrey = tw.stone["800"]
-- local darkgrey = tw.stone["700"]
-- local darkorange = tw.darkorange["800"]
-- local dimmed1 = tw.neutral["500"]
-- local dimmed2 = tw.neutral["600"]
-- local dimmed3 = tw.neutral["700"]
-- local dirtywhite = tw.neutral["200"]
-- local green = tw.green["500"]
-- local leaf = tw.lime["500"]
-- local lightgrey = tw.gray["300"]
-- local magenta = tw.fuchsia["900"]
-- local orange = tw.orange["500"]
-- local pink = tw.pink["500"]
-- local purple = tw.purple["500"]
-- local red = tw.red["500"]
-- local sky = tw.sky["500"]
-- local teal = tw.teal["500"]
-- local white = palette.white
-- local yellow = tw.yellow["500"]
--
-- local sideBar = {
--   background = dark1,
--   foreground = dimmed2,
-- }
--
-- local styles = {
--   comment = { italic = true },
--   keyword = { italic = true }, -- any other keyword
--   type = { italic = true }, -- (preferred) int, long, char, etc
--   storageclass = { italic = true }, -- static, register, volatile, etc
--   structure = { italic = true }, -- struct, union, enum, etc
--   parameter = { italic = true }, -- parameter pass in function
--   annotation = { italic = true },
--   tag_attribute = { italic = true }, -- attribute of tag in reactjs, html, etc...
-- }
-- local semantic_tokens = {
--
--   -- type
--   ["@lsp.type.class"] = { link = "Structure" },
--   ["@lsp.type.decorator"] = { link = "Function" },
--   ["@lsp.type.enum"] = { link = "Structure" },
--   ["@lsp.type.enumNumber"] = { link = "Constant" },
--   ["@lsp.type.function"] = { link = "Function" },
--   ["@lsp.type.interface"] = { link = "Structure" },
--   ["@lsp.type.macro"] = { link = "Macro" },
--   ["@lsp.type.method"] = { link = "Function" },
--   ["@lsp.type.namespace"] = { link = "Identifier" },
--   ["@lsp.type.parameter"] = { link = "Identifier" },
--   ["@lsp.type.property"] = { link = "Identifier" },
--   ["@lsp.type.struct"] = { link = "Structure" },
--   ["@lsp.type.type"] = { link = "Type" },
--   ["@lsp.type.typeParameter"] = { link = "TypeDef" },
--   ["@lsp.type.variable"] = { link = "Identifier" },
--
--   -- mod
--   -- ["@lsp.mod.declaration"] = { fg = cyan },
--   -- ["@lsp.mod.definition"] = { fg = cyan },
--   -- ["@lsp.mod.readonly"] = { fg = magenta },
--   -- ["@lsp.mod.static"] = {},
--   ["@lsp.mod.deprecated"] = { strikethrough = true },
--   -- ["@lsp.mod.abstract"] = {},
--   -- ["@lsp.mod.async"] = {},
--   -- ["@lsp.mod.modification"] = {},
--   -- ["@lsp.mod.documentation"] = {},
--   -- ["@lsp.mod.defaultLibrary"] = {},
--
--   ["@lsp.typemod.class.defaultLibrary"] = { fg = white },
--   -- ["@lsp.typemod.decorator"] = {},
--   -- ["@lsp.typemod.enum"] = {},
--   -- ["@lsp.typemod.enumNumber"] = {},
--   ["@lsp.typemod.function.declaration"] = { fg = green },
--   ["@lsp.typemod.function.defaultLibrary"] = { fg = blue },
--   -- ["@lsp.typemod.interface"] = {},
--   -- ["@lsp.typemod.macro"] = {},
--   -- ["@lsp.typemod.method"] = {},
--   -- ["@lsp.typemod.namespace"] = {},
--   ["@lsp.typemod.parameter.declaration"] = { fg = blue, italic = styles.parameter.italic },
--   -- ["@lsp.typemod.property"] = {},
--   -- ["@lsp.typemod.struct"] = {},
--   -- ["@lsp.typemod.type"] = {},
--   -- ["@lsp.typemod.typeParameter"] = {},
--   ["@lsp.typemod.variable.readonly"] = { fg = magenta },
-- }
--
-- local treesitter = {
--   ["@include"] = { fg = pink }, -- `import`
--   ["@variable"] = { fg = blue },
--   ["@punctuation.delimiter"] = { fg = dimmed2 }, -- `;`
--   ["@punctuation.bracket"] = { fg = dimmed2 }, -- `(`
--   ["@constructor"] = { fg = red }, -- `StrictMode` in `<React.StrictMode>`
--   ["@tag.delimiter"] = { fg = dimmed2 }, -- `<`, `>` in `<div>`
--   ["@operator"] = { fg = pink }, -- `=`, `=>`
--   ["@keyword"] = { fg = pink, italic = styles.keyword.italic }, -- `const`, `export`, `default`
--   ["@parameter"] = { fg = orange },
--
--   ["@keyword.return"] = { fg = red },
--   ["@keyword.operator"] = { fg = red },
--   ["@method.call"] = { fg = green },
--   ["@property"] = { fg = green },
--   ["@function"] = { fg = green },
--   ["@constant.builtin"] = { fg = pink },
--   ["@tag"] = { fg = red },
--   ["@tag.attribute"] = { fg = blue, italic = styles.tag_attribute.italic },
--   ["@attribute"] = { fg = blue },
--   ["@conditional"] = { fg = red },
--   ["@repeat"] = { fg = red },
--   ["@keyword.function"] = { fg = blue, bold = true, italic = styles.keyword.italic },
--   ["@number"] = { fg = magenta },
--   ["@boolean"] = { fg = magenta },
--   ["@type.qualifier"] = { fg = red, italic = styles.type.italic },
--   ["@annotation"] = { fg = blue, italic = styles.annotation.italic },
--   ["@field"] = { fg = red },
--   -- scss
--   ["@keyword.scss"] = { fg = red },
--   ["@function.scss"] = { fg = blue },
--   ["@property.scss"] = { fg = green },
--   ["@string.scss"] = { fg = cyan, italic = true },
--   ["@number.scss"] = { fg = magenta },
--   ["@type.scss"] = { fg = blue },
--   -- cpp
--   ["@keyword.cpp"] = { fg = blue, italic = styles.keyword.italic },
--   ["@namespace.cpp"] = { fg = white },
--   ["@operator.cpp"] = { fg = red },
--   ["@type.cpp"] = { fg = cyan, italic = styles.type.italic },
--   ["@variable.cpp"] = { fg = white },
--   ["@constant.cpp"] = { fg = blue },
--   ["@constant.macro.cpp"] = { fg = red },
--   ["@punctuation.delimiter.cpp"] = { fg = sideBar.foreground },
--   -- python
--   ["@parameter.python"] = { fg = blue, italic = true },
--   ["@type.python"] = { fg = blue },
--   ["@keyword.python"] = { fg = blue, italic = styles.keyword.italic },
--   ["@variable.builtin.python"] = {
--     fg = green,
--     italic = true,
--   },
--   ["@field.python"] = { fg = green },
--   ["@variable.python"] = { fg = white },
--   ["@constructor.python"] = { fg = green },
--   ["@method.python"] = { fg = green },
--   ["@function.builtin.python"] = { fg = blue, italic = true },
--   ["@exception.python"] = { fg = red, italic = true },
--   ["@constant.python"] = { fg = pink },
--   ["@keyword.function.python"] = { fg = blue, italic = styles.keyword.italic },
--   ["@operator.python"] = { fg = red },
--   ["@varibale.builtin.python"] = { fg = cyan, italic = true },
--   -- lua
--   ["@variable.lua"] = { fg = white },
--   ["@function.builtin.lua"] = { fg = green },
--   ["@field.lua"] = { fg = white },
--   ["@keyword.lua"] = { fg = red, italic = styles.keyword.italic },
--   ["@keyword.function.lua"] = { fg = red },
--   ["@conditional.lua"] = { fg = red },
--   ["@namespace.lua"] = { fg = red },
--   ["@string.documentation"] = { fg = dimmed3 },
--   ["@type.builtin"] = { fg = cyan },
--   ["@_isinstance"] = { fg = green },
--   ["@comment.documentation.lua"] = { fg = cyan },
--   ["@parameter.lua"] = { fg = blue, italic = true },
--   -- latex
--   ["@text.environment.latex"] = { fg = green },
--   ["@text.environment.name.latex"] = { fg = blue, italic = true },
--   ["@punctuation.special.latex"] = { fg = red },
--   ["@text.math.latex"] = { fg = magenta },
--   ["@text.strong.latex"] = { bold = true },
--   ["@text.emphasis.latex"] = { italic = true },
--   ["@string.latex"] = { fg = cyan },
--   ["@function.macro.latex"] = { fg = green },
--   -- Dockerfile
--   ["@keyword.dockerfile"] = { fg = red },
--   ["@lsp.type.class.dockerfile"] = { fg = cyan },
--   ["@function.call.bash"] = { fg = green },
--   ["@parameter.bash"] = { fg = white },
-- }
--
-- local theme = {
--   accent1 = red,
--   accent2 = orange,
--   accent3 = yellow,
--   accent4 = green,
--   accent5 = sky,
--   background = darkestgrey,
--   black = black,
--   blue = blue,
--   boolean = magenta,
--   character = magenta,
--   comment = darkgrey,
--   conditional = pink,
--   constant = pink,
--   cyan = cyan,
--   dark1 = dark1,
--   dark2 = black,
--   dark = black,
--   dark_orange = darkorange,
--   define = red,
--   delimiter = white,
--   dimmed1 = lightgrey,
--   dimmed2 = dimmed2, -- border
--   dimmed3 = darkgrey,
--   dimmed4 = bluegrey,
--   dimmed5 = darkergrey,
--   exc = red,
--   float = magenta,
--   func = green,
--   green = green,
--   identifier = orange,
--   include = red,
--   kword = red,
--   label = red,
--   leaf = leaf,
--   macro = red,
--   magenta = magenta,
--   number = magenta,
--   op = red,
--   orange = orange,
--   peat = red,
--   pink = pink,
--   precondit = red,
--   preproc = yellow,
--   purple = purple,
--   red = red,
--   sideBar = sideBar,
--   sky = sky,
--   specialchar = cyan,
--   specialcomment = darkgrey,
--   special = cyan,
--   statement = red,
--   storageclass = pink,
--   structure = cyan,
--   str = yellow,
--   styles = styles,
--   teal = teal,
--   text = dirtywhite,
--   todo = pink,
--   type = blue,
--   typedef = pink,
--   white = white,
--   yellow = yellow,
-- }
--
-- theme.treesitter = treesitter
-- theme.semantic_tokens = semantic_tokens
--
-- return theme
