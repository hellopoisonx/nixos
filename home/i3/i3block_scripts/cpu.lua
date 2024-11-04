local utils = require("utils")
local widget = require("widget")

local function get_cpu_usage()
	local f = io.open("/proc/stat")
	if f == nil then
		os.exit(33)
	end
	local cpu = string.match(f:read("l"), "cpu(.*)")
	local total = 0
	local idle = 0
	local count = 0
	for t in tostring(cpu):gmatch("%s*(%d+)%s*") do
		count = count + 1
		if count == 4 then
			idle = tonumber(t)
		end
		total = total + tonumber(t)
	end
	f:close()
	return idle, total
end

local idle_prev, total_prev = get_cpu_usage()
utils.sleep(2)
local idle_curr, total_curr = get_cpu_usage()
local usage = string.format("%.1f", (idle_curr - idle_prev) / (total_curr - total_prev) * 100)
local w = widget:new(nil, function()
	return " " .. usage .. "%"
end, function()
	return " " .. usage .. "%"
end, function()
	return "#FFFFFF"
end, function()
	return "#000000"
end)
w:formatOutput()
