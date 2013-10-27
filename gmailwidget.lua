---------------------------------------------
--										   --
--			Modified Gmail Widget		   --
--			 							   --
---------------------------------------------
-- Don't forget to copy the modified gmail.lua file in /usr/share/lua/5.2/vicious/widgets
local wibox = require("wibox")
local naughty = require("naughty")
local awful = require("awful")
local vicious = require("vicious")

--[[ Get username and password from file
local f = io.popen("gpg -d ~/.netrc.gpg")
local user
local password
for line in f:lines() do
	local i = string.find(line, "login ")
	local j = string.find(line, "password ")
	user = string.sub(line, i + 6, j - 2)
	password = string.sub(line, j + 9)
end

print("user is " .. user)
print("password is '" .. password .. "'")
]]--
	
local gmailwidget = 
{
	text = wibox.widget.textbox("")
}
gmailwidget.tooltip = awful.tooltip ({ objects = { gmailwidget.text } }) --To display each core info

vicious.register (gmailwidget.text, vicious.widgets.gmail, function (widget, args)
	local text = ""
	local color = "'#970011'"

	if args["{count}"] ~= 0 then
		gmailwidget._notify(args["{sender}"])

		--Setting the tool tip text
		local txt = "Subject: " .. args["{subject}"]
		gmailwidget.tooltip:set_text(txt)
		if args["{count}"] > 1 then
			text = "<span color = " .. color .. "> " .. args["{count}"] .. " Unread Emails " .. "</span>:: "
		else
			text = "<span color = " .. color .. "> " .. args["{count}"] .. " Unread Email " .. "</span>:: "
		end
	end

	return text
end, 13)

--Creating the infinite loop notication
function gmailwidget._notify(sender) 
	naughty.notify (
	{
		preset = naughty.config.presets.normal,
		text = "Email received from " .. sender .. "!"
	})
end

return gmailwidget
