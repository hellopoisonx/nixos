#! /usr/bin/env lua

local widget = require("widget")

local v = {}

function v:sink()
	local res = io.popen("pactl get-default-sink", "r")
	if res == nil then
		return nil
	end
	return res:read("a")
end

function v:volume()
	local res = io.popen("pactl get-sink-volume " .. self:sink(), "r")
	if res == nil then
		return nil
	end
	local raw = res:read("a")
	local vol = 0
	for s in string.gmatch(raw, "(%d+)%%") do
		if tonumber(s) > vol then
			vol = tonumber(s) or 0
		end
	end
	return vol
end

function v:isMuted()
	local res = io.popen("pactl get-sink-mute " .. self:sink(), "r")
	if res == nil then
		return true
	end
	local raw = res:read("a")
	local m = string.match(raw, "%a%a%a%a%p%s(.+)%c")
	if m == "是" then
		return true
	end
	return false
end

local w = widget:new(nil, function()
	if v:isMuted() then
		return " muted"
	end
	local vol = v:volume()
	return " " .. vol .. " %"
end, function()
	if v:isMuted() then
		return "muted"
	end
	local vol = v:volume()
	return vol .. "%"
end, function()
	return "#FFFFFF"
end, function()
	return "#D35400"
end, function()
	return
end)

w:formatOutput()
