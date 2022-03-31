local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local l = require("luasnip.extras").lambda
local rep = require("luasnip.extras").rep

ls.config.set_config {
  history = true,
  -- updateevents = "TextChanged,TextChangedI",
  enable_autosnippets = true,
}

ls.snippets = {
  -- all = {
  -- },
  go = {
    s("main", fmt([[
    func main() {{
      {}
    }}
    ]], { i(1)} )),
    s("f", fmt([[
    func {1}({2}) {3} {{
      {}
    }}
    ]], { i(1), i(2), i(3), i(0) })),
    s("ef", fmt([[
    {1}, err := {2}
    assert.NoErr(err, "failed to {3}")
    ]], { i(1), i(2), i(3) }))
  },
  typescriptreact = {
    -- ls.parser.parse_snippet("imrc", "import React from 'react'\n\nconst $TM_FILENAME_BASE = (): JSX.Element => {\n return (\n   <>$1</>\n )\n}\n\nexport default $TM_FILENAME_BASE"),
    s("cl", fmt("console.log({})", { i(1) })),
    s("imr", fmt("import React from 'react'", {})),
    s("imrc", fmt([[
    import React from 'react'

    const {} = (): JSX.Element => {{
      return (
        <>{}</>
      )
    }}

    export default {}
    ]], { 
        f(function(_, snip)
          return snip.env.TM_FILENAME_BASE or {}
        end, {1}),
        i(0),
        rep(1),
      })),
    s("ue", fmt([[
    useEffect(() => {{
      {1}
    }}, [{2}])
    ]], { i(1), i(2) })),
    s("uc", fmt([[
    const {1} = useCallback(() => {{
      {2}
    }}, [{3}])
    ]], { i(1), i(2), i(3) })),
    s("um", fmt([[
    const {1} = useMemo(() => {{
      {2}
    }}, [{3}])
    ]], { i(1), i(2), i(3) })),
    s("cfa", fmt([[
    const {} = ({}) => {{
      {}
    }}
    ]], { i(1), i(2), i(0) })),
  }
}
