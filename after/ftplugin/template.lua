local filename = vim.fn.expand("%:t")
local non_template_name = string.gsub(filename, "[.]tmpl$", "")
m = string.match(non_template_name, "%.(%a+)$")
if m then
    non_template_ext = string.gsub(non_template_name, "^.*%.(%a+)$", "%1")
    vim.notify("Opened a template file, changing filetype to: " .. non_template_ext)
    vim.bo.filetype = non_template_ext
else
    vim.notify("Opened a template file, but unable to resolve extension: " .. filename)

end

