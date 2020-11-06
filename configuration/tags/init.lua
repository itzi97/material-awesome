local awful = require("awful")
local gears = require("gears")
local icons = require("theme.icons")

local tags = {
  {icon = icons.chrome, type = "chrome", defaultApp = "brave", screen = 1},
  {icon = icons.code, type = "code", defaultApp = "code", screen = 1},
  {icon = icons.social, type = "social", defaultApp = "discord", screen = 1},
  {icon = icons.folder, type = "files", defaultApp = "nautilus", screen = 1},
  {icon = icons.music, type = "music", defaultApp = "spotify", screen = 1},
  {icon = icons.game, type = "game", defaultApp = "steam", screen = 1},
  {icon = icons.lab, type = "any", defaultApp = "", screen = 1},
}

local default_layout = awful.layout.suit.spiral.dwindle

awful.layout.layouts = {awful.layout.suit.tile, default_layout, awful.layout.suit.max}

awful.screen.connect_for_each_screen(
  function(s)
    for i, tag in pairs(tags) do
      awful.tag.add(
        i, {
          icon = tag.icon,
          icon_only = true,
          layout = default_layout,
          gap_single_client = false,
          gap = 8,
          screen = s,
          defaultApp = tag.defaultApp,
          selected = i == 1,
        }
      )
    end
  end
)

_G.tag.connect_signal(
  "property::layout", function(t)
    local currentLayout = awful.tag.getproperty(t, "layout")
    if (currentLayout == awful.layout.suit.max) then
      t.gap = 0
    else
      t.gap = 4
    end
  end
)
