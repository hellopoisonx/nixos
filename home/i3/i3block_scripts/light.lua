#! /usr/bin/env lua

local widget = require("widget")

local function light()
	local res = io.popen("light", "r")
	if res == nil then
		return "nil"
	end
	local s = res:read("a")
	if s == nil then
		return "nil"
	end
	return tostring(math.floor(tonumber(s) or 0))
end

widget
	:new(nil, function()
		return "󱩖 " .. light() .. " %"
	end, function()
		return light() .. "%"
	end, function()
		return "#FFFFFF"
	end, function()
		return "#3498DB"
	end)
	:formatOutput()
