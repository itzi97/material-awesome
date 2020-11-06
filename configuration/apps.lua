local filesystem = require("gears.filesystem")
local with_dpi = require("beautiful").xresources.apply_dpi
local get_dpi = require("beautiful").xresources.get_dpi

return {
  -- List of apps to start by default on some actions
  default = {
    browser = "brave",
    terminal = "kitty",
    pdf_viewer = "evince",
    -- pdf_viewer = "zathura",
    screenshot_full = "flameshot full -c -p " .. os.getenv("HOME") .. "/Pictures/Screenshots/",
    screenshot_gui = "flameshot gui  -p " .. os.getenv("HOME") .. "/Pictures/Screenshots/",
    editor = "nvim",
    rofi = "rofi -dpi " .. get_dpi() .. " -width " .. with_dpi(400) .. " -show drun -theme " ..
      filesystem.get_configuration_dir() .. "/configuration/rofi.rasi",
    lock = "i3lock-fancy-rapid 5-3 -k --timecolor=ffffffff --datecolor=ffffffff",
    quake = "alacritty --title QuakeTerminal"
  },
  -- List of apps to start once on start-up
  run_on_start_up = {
    "picom --config " .. filesystem.get_configuration_dir() .. "/configuration/compton.conf",
    "blueberry-tray", -- Bluetooth tray icon
    "xfce4-power-manager", -- Power manager
    "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 & eval $(gnome-keyring-daemon -s --components=pkcs11,secrets,ssh,gpg)", -- credential manager
    "nitrogen --restore", -- Reload background
    "piactl connect" -- Load VPN
  }
}
