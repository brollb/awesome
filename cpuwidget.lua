local wibox = require("wibox")
local naughty = require("naughty")
local awful = require("awful")
local vicious = require("vicious")
-- CPU Widget
local cpuwidget = 
{
	text = wibox.widget.textbox("(CPU WIDGET)"),
	color = 
		{
			regular = "'#008f00'",
			intense = "'#cc0000'"
		}
}
cpuwidget.tooltip = awful.tooltip ({ objects = { cpuwidget.text } }) --To display each core info

vicious.register (cpuwidget.text, vicious.widgets.cpu, function (widget, args)
	--Setting the tool tip text
	local n = 2
	local txt = " Core #" .. (n - 1) .. ": " .. args[n] .. "% "
	n = n + 1
	while args[n] do
		txt = txt .. "\n Core #" .. (n - 1).. ": " .. args[n] .. "% "
		n = n + 1
	end
		cpuwidget.tooltip:set_text(txt)
	--Setting the widget color text
	local color = cpuwidget.color.regular
	if 80 < args[1] then
		color = cpuwidget.color.intense
		cpuwidget._notify()
	end
	return "<span color = " .. color .. "> CPU: " .. args[1] .. "%</span>"
end, 13 )

--Creating the infinite loop notication
function cpuwidget._notify() 
	naughty.notify (
	{
		preset =
		{
			text = "Possible Infinite Loop!",
			position = "bottom_right",
			height = 25,
			width = 139
		}
	})
end

return cpuwidget
