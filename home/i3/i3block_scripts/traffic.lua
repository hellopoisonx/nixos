local utils = require("utils")
local widget = require("widget")

local function get_device_byte(f, device)
	local line = f:read("l")
	if line == nil then
		return nil
	end
	local res = { up = nil, down = nil }
	if line:match("^" .. device) then
		local count = 0
		for column in line:gmatch("%S+") do
			count = count + 1
			if count == 2 then
				res.down = column
			end
			if count == 10 then
				res.up = column
				return res
			end
		end
	else
		return get_device_byte(f, device)
	end
end

local function start_get_device_byte(device)
	local f = io.open("/proc/net/dev", "r")
	if f == nil then
		os.exit(33)
	end
	local res = get_device_byte(f, device)
	f:close()
	return res
end

local byte_prev = start_get_device_byte("wlp3s0")
utils.sleep(1)
local byte_curr = start_get_device_byte("wlp3s0")

if byte_prev == nil or byte_curr == nil then
	os.exit(33)
end

local byte_up = byte_curr.up - byte_prev.up
local byte_down = byte_curr.down - byte_prev.down

local up = utils.parse_byte(byte_up)
local down = utils.parse_byte(byte_down)

local w = widget:new(nil, function()
	return " " .. up .. "  " .. down
end, function()
	return " " .. up .. "  " .. down
end, function()
	return "#FFFFFF"
end, function()
	return "#000000"
end)

w:formatOutput()
