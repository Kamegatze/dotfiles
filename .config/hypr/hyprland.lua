local key = {
	enter = "Return",
	main = "SUPER",
	shift = "SHIFT",
	alt = "ALT",
	left = "left",
	ctrl = "CTRL",
	bracketleft = "bracketleft",
	bracketright = "bracketright",
	plus = "+",
	right = "right",
	up = "up",
	down = "down",
	a = "A",
	b = "B",
	c = "C",
	d = "D",
	e = "E",
	f = "F",
	g = "G",
	h = "H",
	i = "I",
	j = "J",
	k = "K",
	l = "L",
	m = "M",
	n = "N",
	o = "O",
	p = "P",
	q = "Q",
	r = "R",
	s = "S",
	t = "T",
	u = "U",
	v = "V",
	w = "W",
	x = "X",
	y = "Y",
	z = "Z",
}

local main_mod = key.main
local terminal = "kitty"
local file_manager = terminal .. " -e sh -c 'ranger'"
local menu = "fuzzel"
local delimeter_key_mapping = key.plus

hl.on("hyprland.start", function()
	hl.exec_cmd("waybar")
	hl.exec_cmd("hypridle")
	hl.exec_cmd("wl-paste --type text --watch cliphist store")
	hl.exec_cmd("wl-paste --type image --watch cliphist store")
	hl.exec_cmd("swww-daemon")
	hl.exec_cmd("swww img ~/Pictures/wp.png")
	hl.exec_cmd("systemctl --user start ssh-tunnel.service")
	hl.exec_cmd("systemctl --user restart xdg-desktop-portal.service")
end)

hl.monitor({
	output = "DP-3",
	mode = "3440x1440@180",
	position = "0x0",
	scale = "1",
})
hl.monitor({
	output = "HDMI-A-1",
	mode = "1920x1080",
	position = "3440x0",
	scale = "1",
})

hl.gesture({
	fingers = 3,
	direction = "horizontal",
	action = "workspace",
})

hl.config({
	general = {
		border_size = 5,
		col = {
			active_border = { colors = { "rgba(d65d0eff)", "rgba(98971aff)" }, angle = 45 },
			inactive_border = "rgba(3c3836ff)",
		},
		gaps_in = 0,
		gaps_out = 0,
		layout = "master",
		resize_on_border = true,
	},
	ecosystem = {
		no_update_news = true,
	},
	animations = {
		enabled = false,
	},

	decoration = {
		blur = {
			enabled = false,
		},
		shadow = {
			enabled = false,
		},
		active_opacity = 1.000000,
		inactive_opacity = 1.000000,
		rounding = 0,
	},
	gestures = {
		workspace_swipe_forever = true,
		workspace_swipe_invert = false,
	},
	input = {
		kb_layout = "us,ru",
		kb_options = "grp:alt_shift_toggle",
	},
	master = {
		mfact = 0.500000,
		new_on_top = true,
		new_status = "slave",
	},
	dwindle = {
		preserve_split = true,
	},
	misc = {
		disable_hyprland_logo = true,
		force_default_wallpaper = 0,
	},
})

-- Main keybinds. See README.md for a nice table
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.enter),
	hl.dsp.exec_cmd(terminal)
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.c),
	hl.dsp.window.close()
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.q),
	hl.dsp.exit()
)
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.r), hl.dsp.exec_cmd(file_manager))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.f), hl.dsp.window.float({ action = "toggle" }))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.f),
	hl.dsp.window.fullscreen()
)
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.d), hl.dsp.exec_cmd(menu))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.p),
	hl.dsp.window.pin()
)
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.j), hl.dsp.layout("togglesplit"))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.e), hl.dsp.exec_cmd("bemoji -cn"))
hl.bind(
	string.format("%s %s %s", main_mod, delimeter_key_mapping, key.v),
	hl.dsp.exec_cmd("cliphist list | $menu --dmenu | cliphist decode | wl-copy")
)
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.b), hl.dsp.exec_cmd("pkill -SIGUSR2 waybar"))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.b),
	hl.dsp.exec_cmd("pkill -SIGUSR2 waybar")
)
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.l), hl.dsp.exec_cmd("hyprlock"))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.p), hl.dsp.exec_cmd("hyprpicker -an"))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.n), hl.dsp.exec_cmd("swaync-client -t"))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.p),
	hl.dsp.exec_cmd("grimblast --notify --freeze copysave area")
)

-- Global binds
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.o),
	hl.dsp.pass({ window = "class:^(com\\.obsproject\\.Studio)$" })
)

-- Move focus
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.left), hl.dsp.focus({ direction = "left" }))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.right), hl.dsp.focus({ direction = "right" }))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.up), hl.dsp.focus({ direction = "up" }))
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.down), hl.dsp.focus({ direction = "down" }))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.h),
	hl.dsp.focus({ direction = "left" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.l),
	hl.dsp.focus({ direction = "right" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.k),
	hl.dsp.focus({ direction = "up" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.j),
	hl.dsp.focus({ direction = "down" })
)

-- Swap window
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.left),
	hl.dsp.window.swap({ direction = "left" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.right),
	hl.dsp.window.swap({ direction = "right" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.up),
	hl.dsp.window.swap({ direction = "up" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.down),
	hl.dsp.window.swap({ direction = "down" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.alt, delimeter_key_mapping, key.h),
	hl.dsp.window.swap({ direction = "left" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.alt, delimeter_key_mapping, key.l),
	hl.dsp.window.swap({ direction = "right" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.alt, delimeter_key_mapping, key.k),
	hl.dsp.window.swap({ direction = "up" })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.alt, delimeter_key_mapping, key.j),
	hl.dsp.window.swap({ direction = "down" })
)

-- Resize winddow
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.left),
	hl.dsp.window.resize({ x = -60, y = 0, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.right),
	hl.dsp.window.resize({ x = 60, y = 0, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.up),
	hl.dsp.window.resize({ x = 0, y = -60, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.down),
	hl.dsp.window.resize({ x = 0, y = 60, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.h),
	hl.dsp.window.resize({ x = -60, y = 0, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.l),
	hl.dsp.window.resize({ x = 60, y = 0, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.k),
	hl.dsp.window.resize({ x = 0, y = -60, relative = true })
)
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.ctrl, delimeter_key_mapping, key.j),
	hl.dsp.window.resize({ x = 0, y = 60, relative = true })
)

-- Switch to workspace
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 1), hl.dsp.focus({ workspace = 1 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 2), hl.dsp.focus({ workspace = 2 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 3), hl.dsp.focus({ workspace = 3 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 4), hl.dsp.focus({ workspace = 4 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 5), hl.dsp.focus({ workspace = 5 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 6), hl.dsp.focus({ workspace = 6 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 7), hl.dsp.focus({ workspace = 7 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 8), hl.dsp.focus({ workspace = 8 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 9), hl.dsp.focus({ workspace = 9 }))
hl.bind(string.format("%s %s %d", main_mod, delimeter_key_mapping, 0), hl.dsp.focus({ workspace = 10 }))

-- Move window to workspace
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 1),
	hl.dsp.window.move({ workspace = 1, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 2),
	hl.dsp.window.move({ workspace = 2, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 3),
	hl.dsp.window.move({ workspace = 3, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 4),
	hl.dsp.window.move({ workspace = 4, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 5),
	hl.dsp.window.move({ workspace = 5, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 6),
	hl.dsp.window.move({ workspace = 6, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 7),
	hl.dsp.window.move({ workspace = 7, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 8),
	hl.dsp.window.move({ workspace = 8, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 9),
	hl.dsp.window.move({ workspace = 9, silent = true })
)
hl.bind(
	string.format("%s %s %s %s %d", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, 0),
	hl.dsp.window.move({ workspace = 10, silent = true })
)

-- Magic workspace 🪄
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, key.s), hl.dsp.workspace.toggle_special("magic"))
hl.bind(
	string.format("%s %s %s %s %s", main_mod, delimeter_key_mapping, key.shift, delimeter_key_mapping, key.s),
	hl.dsp.window.move({ workspace = "special:magic" })
)

-- Volume management
hl.bind(
	"XF86AudioMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
	{ release = true, locked = true }
)
hl.bind(
	"XF86AudioLowerVolume",
	hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),
	{ release = true, locked = true }
)
hl.bind(
	"XF86AudioRaiseVolume",
	hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"),
	{ release = true, locked = true }
)
hl.bind(
	"XF86AudioMicMute",
	hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
	{ release = true, locked = true }
)

-- Brightness management
-- bind = , XF86MonBrightnessDown, exec, brightnessctl set 10%-
-- bind = , XF86MonBrightnessUp, exec, brightnessctl set 10%+
hl.bind(
	string.format("%s %s %s", main_mod, delimeter_key_mapping, key.bracketleft),
	hl.dsp.exec_cmd("brightnessctl s 10%-")
)
hl.bind(
	string.format("%s %s %s", main_mod, delimeter_key_mapping, key.bracketright),
	hl.dsp.exec_cmd("brightnessctl s 10%+")
)

-- Multimedia binds
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))

-- Move with LMS
hl.bind(string.format("%s %s %s", main_mod, delimeter_key_mapping, "mouse:272"), hl.dsp.window.drag(), { mouse = true })
-- Resize with RMS
hl.bind(
	string.format("%s %s %s", main_mod, delimeter_key_mapping, "mouse:273"),
	hl.dsp.window.resize(),
	{ mouse = true }
)

-- Environment variables
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("QT_QPA_PLATFORM", "wayland")
hl.env("XDG_SCREENSHOTS_DIR", os.getenv("HOME") .. "/screens")

-- Window Rules
-- If there is just one tiling window on the workspace it will be borderless
hl.window_rule({
	border_size = 0,
	match = { float = false, workspace = "w[tv1]" },
})

-- Floating by default
hl.window_rule({
	float = true,
	match = { class = "(mpv)|(imv)|(anki)|(showmethekey-gtk)|(Emulator)|(blueman-manager)" },
})

-- Where to spawn showmethekey-gtk window
hl.window_rule({
	move = { 990, 60 },
	size = { 900, 170 },
	pin = true,
	no_initial_focus = true,
	match = { class = "(showmethekey-gtk)" },
})
hl.window_rule({
	border_size = 0,
	no_focus = true,
	match = { class = "(showmethekey-gtk)" },
})

-- Distribution of windows among workspaces
hl.window_rule({
	workspace = 3,
	match = { class = "(obsidian)" },
})
hl.window_rule({
	workspace = 3,
	match = { class = "(zathura)" },
})
hl.window_rule({
	workspace = 3,
	match = { class = "(anki)" },
})
hl.window_rule({
	workspace = 4,
	match = { class = "(com.obsproject.Studio)" },
})
hl.window_rule({
	workspace = 5,
	match = { class = "(telegram)" },
})
hl.window_rule({
	workspace = 5,
	match = { class = "(vesktop)" },
})
hl.window_rule({
	workspace = 6,
	match = { class = "(teams-for-linux)" },
})
hl.window_rule({
	workspace = 7,
	match = { class = "(org.kde.kdenlive)" },
})
hl.window_rule({
	workspace = 8,
	match = { class = "(blender)" },
})
hl.window_rule({
	workspace = 9,
	match = { class = "(one.alynx.showmethekey)" },
})

-- XWayland fixes
hl.window_rule({
	suppress_event = "maximize",
	match = { class = ".*" },
})

hl.window_rule({
	no_focus = true,
	match = { class = "^$", title = "^$", xwayland = true, float = true, fullscreen = false, pin = false },
})

hl.window_rule({
	opacity = "0.0 override",
	match = { class = "^(xwaylandvideobridge)$" },
})
hl.window_rule({
	no_anim = true,
	match = { class = "^(xwaylandvideobridge)$" },
})
hl.window_rule({
	no_initial_focus = true,
	match = { class = "^(xwaylandvideobridge)$" },
})
hl.window_rule({
	max_size = { 1, 1 },
	match = { class = "^(xwaylandvideobridge)$" },
})
hl.window_rule({
	no_blur = true,
	match = { class = "^(xwaylandvideobridge)$" },
})
hl.window_rule({
	no_focus = true,
	match = { class = "^(xwaylandvideobridge)$" },
})

-- No gaps if only one window on the workspace (not needed if you disabled gaps)
hl.workspace_rule({
	workspace = "w[tv1]",
	gaps_in = 0,
	gaps_out = 0,
})
hl.workspace_rule({
	workspace = "f[1]",
	gaps_out = 0,
	gaps_in = 0,
})
