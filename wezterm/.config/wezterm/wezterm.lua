local wezterm = require("wezterm")

local config = {
  font = wezterm.font("FantasqueSansM Nerd Font"),
  font_size = 16,
  harfbuzz_features = { "calt=0", "clig=0", "liga=0" },
  enable_tab_bar = false,

  window_background_opacity = 0.9,
  color_scheme = "Eldritch",

  -- Open link at mouse cursor
  mouse_bindings = {
    {
      -- Ctrl+LeftClick will open link under mouse cursor
      event = { Up = { streak = 1, button = "Left" } },
      mods = "CTRL",
      action = wezterm.action.OpenLinkAtMouseCursor,
    },
  },

  keys = {
    -- Disable default Super+w
    {
      key = "w",
      mods = "CMD",
      action = wezterm.action.DisableDefaultAssignment,
    },
    -- Disable default Super+n
    {
      key = "n",
      mods = "CMD",
      action = wezterm.action.DisableDefaultAssignment,
    }
  },
}

return config
