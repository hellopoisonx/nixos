local _M = {}

local units = { "B", "KB", "MB", "GB", "TB" }

---@param byte integer
---@return string
function _M.parse_byte(byte)
	if byte <= 0 then
		return "0B"
	end
	local unit_index = math.floor(math.log(byte, 2) / 10)
	local unit = units[unit_index + 1]
	local digit = string.format("%.1f", byte / (2 ^ (unit_index * 10)))
	return digit .. unit
end

---@param sec integer
function _M.sleep(sec)
	local timer = io.popen("sleep " .. sec)
	if timer == nil then
		os.exit(33)
	end
	timer:close()
end

return _M
