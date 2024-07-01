-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'

-- https://wezfurlong.org/wezterm/config/lua/config/default_cursor_style.html
config.default_cursor_style = 'SteadyBar'

-- https://wezfurlong.org/wezterm/config/keyboard-concepts.html#macos-left-and-right-option-key
config.send_composed_key_when_left_alt_is_pressed = true
-- config.send_composed_key_when_right_alt_is_pressed = false

-- https://github.com/wez/wezterm/issues/410#issuecomment-770507001
config.use_dead_keys = false

config.use_ime=false

config.keys = {
  -- paste from the clipboard
  { key = 'v', mods = 'CTRL', action = act.PasteFrom 'Clipboard' },

  -- paste from the primary selection
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'PrimarySelection' },
}

-- Temporary disable default key bindings
-- https://wezfurlong.org/wezterm/config/default-keys.html
config.disable_default_key_bindings = true

-- and finally, return the configuration to wezterm
return config
