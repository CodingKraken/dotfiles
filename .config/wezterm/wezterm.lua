local wezterm = require 'wezterm'
local helpers = require 'helpers'
local act = wezterm.action

-- configuration
local config = {}
helpers.apply_to_config(config)


-- initial setup
config.initial_cols = 140
config.initial_rows = 35
config.enable_tab_bar = false

-- theme configuration
local my_theme = wezterm.color.get_builtin_schemes()['BlulocoDark']
my_theme.cursor_bg = 'silver'
my_theme.cursor_border = 'silver'

config.color_schemes = {
	['my theme'] = my_theme
}

config.color_scheme = 'my theme'

config.font = wezterm.font("Fira Code Nerd Font Mono", { weight = 'Medium'})
config.default_cursor_style = 'BlinkingBlock'
config.cursor_blink_rate = 600
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"
config.detect_password_input = false

-- Neovim integration
local function is_vim(pane)
  -- this is set by the plugin, and unset on ExitPre in Neovim
  return pane:get_user_vars().IS_NVIM == 'true'
end

local direction_keys = {
  Left = 'h',
  Down = 'j',
  Up = 'k',
  Right = 'l',
  -- reverse lookup
  h = 'Left',
  j = 'Down',
  k = 'Up',
  l = 'Right',
}

local function split_nav(resize_or_move, key)
	return {
		key = key,
		mods = resize_or_move == 'resize' and 'META' or 'CTRL',
		action = wezterm.action_callback(function(win, pane)
			if is_vim(pane) then
				-- pass the keys through to vim/nvim
				win:perform_action({
				SendKey = { key = key, mods = resize_or_move == 'resize' and 'META' or 'CTRL' },
				}, pane)
			else
				if resize_or_move == 'resize' then
				win:perform_action({ AdjustPaneSize = { direction_keys[key], 3 } }, pane)
				else
				win:perform_action({ ActivatePaneDirection = direction_keys[key] }, pane)
				end
			end
    	end),
	}
end

-- pane keybinds
config.keys = {
	-- split panes
	{ key = 'v', mods = 'ALT|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
	{ key = 's', mods = 'ALT|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
	-- rotate panes
	{ key = 'b', mods = 'CTRL|SHIFT', action = act.RotatePanes 'CounterClockwise' },
	{ key = 'n', mods = 'CTRL|SHIFT', action = act.RotatePanes 'Clockwise' },
	-- swap panes
	{ key = 'r', mods = 'CTRL|SHIFT', action = act.PaneSelect { mode = 'SwapWithActive'} },
	-- kill panes
	{ key = 'q', mods = 'CTRL|SHIFT', action = act.CloseCurrentPane { confirm = true }},
	-- move between split panes
	split_nav('move', 'h'),
	split_nav('move', 'j'),
	split_nav('move', 'k'),
	split_nav('move', 'l'),
	-- resize panes
	split_nav('resize', 'h'),
	split_nav('resize', 'j'),
	split_nav('resize', 'k'),
	split_nav('resize', 'l'),
}

return config
