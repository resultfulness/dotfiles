local config_path = vim.fn.stdpath("config")
local plugins_path = config_path .. "/lua/plugins"

local files = vim.fn.split(vim.fn.globpath(plugins_path, "*.lua"), "\n")

for _, file in ipairs(files) do
    local plugin_name = vim.fn.fnamemodify(file, ":t:r")
    if plugin_name ~= "init" then
        local module = "plugins." .. plugin_name

        local ok = pcall(require, module)
        if not ok then
            vim.notify(
                "error loading plugin '" .. plugin_name .. "'",
                vim.log.levels.ERROR
            )
        end
    end
end
