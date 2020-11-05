local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local dpi = require("beautiful").xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. "/icons/"
theme.font = "Roboto medium 10"

-- Colors Pallets

-- Primary
theme.primary = mat_colors.blue_grey
theme.primary.hue_500 = mat_colors.blue_grey.hue_500

-- Accent
theme.accent = mat_colors.pink

-- Background
theme.background = mat_colors.blue_grey
theme.background.hue_800 = mat_colors.blue_grey.hue_800
theme.background.hue_900 = mat_colors.blue_grey.hue_900

local awesome_overrides = function(theme)
  -- Borders
  theme.border_width = dpi(1)

  -- Icon theme
  theme.icon_theme = "Papirus-Dark-Maia"
end
return {theme = theme, awesome_overrides = awesome_overrides}
