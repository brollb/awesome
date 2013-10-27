--Don't forget to symlink this to the /usr/share/awesome/lib directory!
local wibox = require("wibox")
local awful = require("awful")
local vicious = require("vicious")
-- UPTIME Widget
local uptimewidget = 
{
	text = wibox.widget.textbox(),
}
uptimewidget.tooltip = awful.tooltip ({ objects = { uptimewidget.text } }) 
uptimewidget.tooltip:set_text("UPTIME")
vicious.register(uptimewidget.text, vicious.widgets.uptime,
function (widget, args)
return string.format("%2d day(s) %02d:%02d ", args[1], args[2], args[3])
end, 61)

return uptimewidget

