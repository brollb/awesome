---------------------------------------------------
-- Licensed under the GNU General Public License v2
--  * (c) 2010, Adrian C. <anrxc@sysphere.org>
---------------------------------------------------

-- {{{ Grab environment
local type = type
local tonumber = tonumber
local io = { popen = io.popen }
local setmetatable = setmetatable
local helpers = require("vicious.helpers")
local string = {
    find = string.find,
    match = string.match
}
-- }}}


-- Gmail: provides count of new and subject of last e-mail on Gmail
-- vicious.widgets.gmail
local gmail = {}


-- {{{ Variable definitions
local rss = {
  inbox   = {
    "https://mail.google.com/mail/feed/atom",
    "Gmail %- Inbox"
  },
  unread  = {
    "https://mail.google.com/mail/feed/atom/unread",
    "Gmail %- Label"
  },
  --labelname = {
  --  "https://mail.google.com/mail/feed/atom/labelname",
  --  "Gmail %- Label"
  --},
}

-- Default is just Inbox
local feed = rss.inbox
local mail = {
    ["{count}"]   = 0,
    ["{subject}"] = "N/A",
    ["{sender}"] = "N/A"
}
-- }}}

-- {{{ Helper Function for Handling long strings
local function adjustLongString(string, warg)
    -- Check if we should scroll, or maybe truncate
    if warg then
        if type(warg) == "table" then
            string = helpers.scroll(string, warg[1], warg[2])
        else
            string = helpers.truncate(string, warg)
        end
    end
return string
end
-- }}}


-- {{{ Gmail widget type
local function worker(format, warg)
    -- Get info from the Gmail atom feed
    local f = io.popen("curl --connect-timeout 1 -m 3 -fsn " .. feed[1])

    -- Could be huge don't read it all at once, info we are after is at the top
    for line in f:lines() do
        mail["{count}"] = -- Count comes before messages and matches at least 0
          tonumber(string.match(line, "<fullcount>([%d]+)</fullcount>")) or mail["{count}"]

        -- Find subject and sender tags
        local title = string.match(line, "<title>(.*)</title>")
        local sender = string.match(line, "<name>(.*)</name>")

        if title ~= nil and not string.find(title, feed[2]) then
            title = adjustLongString(title, warg)
            -- Spam sanitize the subject and store
            mail["{subject}"] = helpers.escape(title)
        end

        if sender ~= nil and mail["{sender}"] == "N/A" then
            sender = adjustLongString(sender, warg)
            -- Spam sanitize the subject and store
            mail["{sender}"] = helpers.escape(sender)
            break
        end
    end
    f:close()

    return mail
end
-- }}}

return setmetatable(gmail, { __call = function(_, ...) return worker(...) end })
