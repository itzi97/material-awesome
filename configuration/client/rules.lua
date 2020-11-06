local awful = require("awful")
local gears = require("gears")
local client_keys = require("configuration.client.keys")
local client_buttons = require("configuration.client.buttons")

-- Rules
awful.rules.rules = {
  -- All clients will match this rule.
  {
    rule = {},
    properties = {
      focus = awful.client.focus.filter,
      raise = true,
      keys = client_keys,
      buttons = client_buttons,
      screen = awful.screen.preferred,
      placement = awful.placement.no_offscreen,
      floating = false,
      maximized = false,
      above = false,
      below = false,
      ontop = false,
      sticky = false,
      maximized_horizontal = false,
      maximized_vertical = false,
    },
  }, {rule_any = {name = {"QuakeTerminal"}}, properties = {skip_decoration = true}}, -- Titlebars
  {
    rule_any = {
      type = {"dialog"},
      class = {"Wicd-client.py", "calendar.google.com", "Toggl Desktop", "Clockify"},
    },
    properties = {
      placement = awful.placement.centered,
      ontop = true,
      floating = true,
      drawBackdrop = true,
      shape = function() return function(cr, w, h) gears.shape.rounded_rect(cr, w, h, 8) end end,
      skip_decoration = true,
    },
  }, {
    rule_any = {class = {"MEGAsync"}},
    properties = {ontop = true, floating = true, drawBackdrop = false, skip_decoration = true},
  }, -- Move default programs to their tag
  {rule_any = {class = {"firefox", "Brave-browser"}}, properties = {tag = "1"}},
  {rule_any = {class = {"discord", "Thunderbird"}}, properties = {tag = "3"}},
  {rule_any = {class = {"Spotify"}}, properties = {tag = "5"}},
  {rule_any = {class = {"Steam"}}, properties = {tag = "6"}},
}
