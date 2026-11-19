require("opts")
require("autocmds")

local plugins = require("plugins")
require("binds").setup({ plugins = plugins })

require("godot").setup()
