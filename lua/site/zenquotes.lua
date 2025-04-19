--- file lua/site/zenquotes.lua
local curl = require("plenary.curl")
local json = vim.fn.json_decode

local M = {}

---@return string
M.get_zen_quote = function()
    local response = curl.get("https://zenquotes.io/api/today")

    if response.status == 200 then
        local data = json(response.body)

        if data and type(data) == "table" and #data > 0 then
            return data[1].q
        else
            return "The Quote Well Has Run Dry!"
        end
    else
        return "The Quote Well Has Run Dry!"
    end
end

return M
