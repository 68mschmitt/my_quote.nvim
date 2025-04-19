-- lua/quote.lua
local zq = require("site.zenquotes")

---@class Config
local config = {
    site = "zenquotes",
}

local M = {}

---@type Config
M.config = config

-- get quote method
M.get_quote = function()
    if M.config.site == "zenquotes" then
        return zq.get_zen_quote()
    else
        return "No Quotes for You... Until Setup is Complete!"
    end
end

-- Execute plugin
M.execute = function()
    vim.api.nvim_create_user_command("Quote", function()
        vim.notify(M.get_quote())
    end, {})
end

-- Setup method
M.setup = function(args)
    M.config = vim.tbl_deep_extend("force", M.config, args or {})
    M.execute()
end

return M
