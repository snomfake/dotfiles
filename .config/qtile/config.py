# ===========================================
#
#    ██████╗ ████████╗██╗██╗     ███████╗
#   ██╔═══██╗╚══██╔══╝██║██║     ██╔════╝
#   ██║   ██║   ██║   ██║██║     █████╗
#   ██║▄▄ ██║   ██║   ██║██║     ██╔══╝
#   ╚██████╔╝   ██║   ██║███████╗███████╗
#    ╚══▀▀═╝    ╚═╝   ╚═╝╚══════╝╚══════╝
#
# ===========================================

from os import path

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

vol = path.expanduser("~/.scripts/vol.sh")

mod = "mod4"

keys = [
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key(
        [mod],
        "t",
        lazy.window.toggle_floating(),
        desc="Toggle floating on the focused window",
    ),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "e", lazy.spawn("thunar"), desc="file manager"),
    Key([mod], "Return", lazy.spawn("kitty"), desc="terminal"),
    Key([mod], "s", lazy.spawn("spotify-launcher"), desc="spotify"),
    Key([], "XF86AudioMute", lazy.spawn(f"{vol} mute"), desc="mute volume"),
    Key([], "XF86AudioLowerVolume", lazy.spawn(f"{vol} down"), desc="down volume"),
    Key([], "XF86AudioRaiseVolume", lazy.spawn(f"{vol} up"), desc="up volume"),
    Key(
        [],
        "XF86AudioPlay",
        lazy.spawn("playerctl play-pause"),
        desc="play/pause player",
    ),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next"), desc="skip to next"),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous"), desc="skip to previous"),
    Key([], "Print", lazy.spawn("flameshot gui"), desc="make screenshot"),
    Key(["mod1"], "Shift_L", lazy.widget["keyboardlayout"].next_keyboard()),
]

groups = [Group(i) for i in "12345"]

groups = [
    Group("1", label=" ", matches=[Match(wm_class=["kitty"])]),
    Group("2", label=" ", matches=[Match(wm_class=["firefox"])]),
    Group("3", label=" ", matches=[Match(wm_class=["spotify"])]),
    Group("4", label=" ", matches=[Match(wm_class=["telegram"])]),
    Group("5", label=" "),
]

for i in groups:
    keys.extend(
        [
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc="Switch to group {}".format(i.name),
            ),
            Key(
                [mod, "shift"],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc="Switch to & move focused window to group {}".format(i.name),
            ),
        ]
    )

layouts = [
    layout.Columns(
        boreder_width=3,
        border_focus="#ffffff",
        border_normal="#333333",
    ),
    layout.Max(),
]

widget_defaults = dict(
    font="JetBrains Mono, Bold",
    fontsize=12,
    padding=4,
)
extension_defaults = widget_defaults.copy()

separatot = " ┇ "

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(),
                widget.TextBox("┇  "),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox(separatot),
                widget.KeyboardLayout(configured_keyboards=["us", "ru"]),
                widget.TextBox(separatot),
                widget.Clock(format=f"  %m.%d {separatot}   %I:%M "),
            ],
            24,
        ),
    ),
]

mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
floating_layout = layout.Floating(
    border_focus="#ffffff",
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ],
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

auto_minimize = True

wl_input_rules = None

wmname = "LG3D"
