local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.setup()
ls.add_snippets("r", {
    s({
        trig = "chunk",
        name = "chunk",
        desc = "Insert chunk with fold markers",
    }, {
        t({
            "# %% CHUNK: {{{",
            "",
            "# }}}",
        }),
    }),
})
