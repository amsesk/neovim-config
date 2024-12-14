return {
    name = "devtools install",
    builder = function()
        return {
            cmd = {"R CMD \"devtools::install('.')\""},
        }
    end,
}
