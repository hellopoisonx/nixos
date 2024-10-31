#! /usr/bin/env lua

---@alias f fun(): string
---@alias colr fun(): string

---@class Widget
---@field format f
---@field formatShort f
---@field bg colr
---@field color colr
---@field isErgent nil|fun(): boolean
local _M = {}

---@param o? table
---@param format f
---@param formatShort f
---@param color colr
---@param bg colr
---@param isErgent nil|fun(): boolean
---@return Widget
function _M:new(o, format, formatShort, color, bg, isErgent)
	o = o or {}
	setmetatable(o, self)
	self.__index = self
	self.format = format
	self.formatShort = formatShort
	self.color = color
	self.bg = bg
	self.isErgent = isErgent
	return o
end

---@return nil
function _M:formatOutput()
	if self.isErgent ~= nil and self:isErgent() then
		io.stdout:write(self:_f())
		os.exit(33)
	end
	io.stdout:write(self:_f())
	os.exit(0)
end

---@return string
function _M:_f()
	return string.format("%s\n%s\n%s\n%s\n", self:format(), self:formatShort(), self:color(), self:bg())
end

return _M
