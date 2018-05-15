local awful = require('awful')
local wibox = require('wibox')
local vicious = require('vicious')
-- Pacman Widget
pacwidget = wibox.widget.textbox()
pacwidget_t = awful.tooltip({ objects = { pacwidget},})
vicious.register(pacwidget, vicious.widgets.pkg,
                function(widget,args)
                    local io = { popen = io.popen }
                    local s = io.popen("pacman -Qu")
                    local str = "UP TO DATE!"

                    for line in s:lines() do
                    if str == "UP TO DATE!" then
                        str = line
                    else
                        str = str .. '\n' .. line
                    end
                    end
                    pacwidget_t:set_text(str)
                    s:close()
					if args[1] == 0 then
                    	pacwidget_t:set_text("Up To Date!")
					end
                    return "UPDATES: " .. args[1]
                end, 1800, "Arch")

return pacwidget;
