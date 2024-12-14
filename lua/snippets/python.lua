local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

ls.setup()
ls.add_snippets("python", {
    s({
        trig = "argparser",
        name = "argparser",
        desc = "Insert the skeleton of an ArgumentParser.",
    }, {
        t({
            "parser = argparse.ArgumentParser()",
            'parser.add_argument("-", "--", action = "store", help = "")',
            'parser.add_argument("-", "--", action = "store", help = "")',
            'parser.add_argument("-", "--", action = "store", help = "")',
            "args = parser.parse_args()",
        }),
    }),
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
