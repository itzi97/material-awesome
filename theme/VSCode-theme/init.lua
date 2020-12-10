local filesystem = require("gears.filesystem")
local mat_colors = require("theme.mat-colors")
local theme_dir = filesystem.get_configuration_dir() .. "/theme"
local dpi = require("beautiful").xresources.apply_dpi

local theme = {}
theme.icons = theme_dir .. "/icons/"
theme.font = "Roboto medium 10"

-- Colors Pallets

-- Primary
theme.primary = mat_colors.grey
theme.primary.hue_500 = mat_colors.grey.hue_800

-- Accent
theme.accent = mat_colors.green

-- Background
theme.background = mat_colors.grey
theme.background.hue_800 = mat_colors.grey.hue_900
theme.background.hue_900 = mat_colors.black

local awesome_overrides = function(theme)
  -- Borders
  theme.border_width = dpi(2)

  -- Icon theme
  theme.icon_theme = "Papirus-Dark-Maia"
end
return {theme = theme, awesome_overrides = awesome_overrides}
