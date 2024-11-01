#! /usr/bin/env lua

local req = require("http.request")
local cjson = require("cjson")
local units = { "B", "KB", "MB", "GB", "TB" }
local widget = require("widget")

local _, stream = assert(req.new_from_uri("http://localhost:9090/traffic"):go())
local traffics = stream:get_next_chunk(500)
traffics = cjson.decode(traffics)
local function parse_traffic(t)
	if t <= 0 then
		return "0B/s"
	end
	local unit_index = math.floor(math.log(t, 2) / 10)
	local unit = units[unit_index + 1]
	local digit = string.format("%.1f", t / (2 ^ (unit_index * 10)))
	return digit .. unit .. "/s"
end
-- print(format(traffics.up))
-- print(format(traffics.down))
local w = widget:new(nil, function()
	local up = parse_traffic(traffics.up)
	local down = parse_traffic(traffics.up)
	return " " .. up .. "  " .. down
end, function()
	local up = parse_traffic(traffics.up)
	local down = parse_traffic(traffics.up)
	return " " .. up .. "  " .. down
end, function()
	return "#FFFFFF"
end, function()
	return "#239B56"
end)

w:formatOutput()
