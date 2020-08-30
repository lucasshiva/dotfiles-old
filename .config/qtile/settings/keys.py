from libqtile.config import Key, Drag, Click
from libqtile.lazy import lazy

from settings.groups import groups

# Mod key to Super key (Win)
mod = "mod4"
alt = "mod1"
shift = "shift"
ctrl = "control"

keypad = {
    "1": "KP_End",
    "2": "KP_Down",
    "3": "KP_Next",
    "4": "KP_Left",
    "5": "KP_Begin",
    "6": "KP_Right"
}

# Window related keybindings
window_keys = [
    # Toggle fullscreen
    Key([alt, shift], "f", lazy.window.toggle_fullscreen()),
    
    # Toggle floating
    Key([alt, shift], "s", lazy.window.toggle_floating()),
    
    # Close focused window.
    Key([mod], "q", lazy.window.kill()),
]

# Layout related keybindings
layout_keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down(), {"desc": "Go to bottom window"}),
    Key([mod], "j", lazy.layout.up()),
    
    # Move windows up or down in current stack
    Key([mod, ctrl], "k", lazy.layout.shuffle_down()),
    Key([mod, ctrl], "j", lazy.layout.shuffle_up()),
    
    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),
    
    # Swap panes of split stack
    Key([mod, shift], "space", lazy.layout.rotate()),
    
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
]

# Keybindings that opens applications.
app_keys = [
    # Terminal emulator
    Key([mod], "Return", lazy.spawn("kitty")),
    
    # File explorer
    Key([mod], "f", lazy.spawn("thunar")),
    
    # Web browser
    Key([mod], "w", lazy.spawn("firefox")),
    
    # Music player
    Key([mod], "s", lazy.spawn("spotify")),
    
    # Code editor
    Key([mod], "c", lazy.spawn("code")),
    
    # Open application launcher
    Key([mod], "r", lazy.spawn("rofi -show drun")),
    
    # Show open windows/apps
    Key([alt], "Tab", lazy.spawn("rofi -show window")),
]

# System related keybindings.
system_keys = [
    # Restart QTile
    Key([mod, ctrl], "r", lazy.restart()),
    
    # Quit QTile (Same as logging out.)
    Key([mod, ctrl], "q", lazy.shutdown()),
    
    # Increase/decrease volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pamixer -i 5")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pamixer -d 5"))
]

# Merge keybindings into one list.
# This will be imported by 'config.py'
keys = window_keys + layout_keys + app_keys

# Group related keybindings.
for index, group in enumerate(groups, start=1):
    index = str(index)
    
    group_keys = [
        # mod1 + letter of group = switch to group. Also allows keypad numbers
        Key([mod], index, lazy.group[group.name].toscreen()),
        Key([mod], keypad[index], lazy.group[group.name].toscreen()),
            
        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, shift], index, lazy.window.togroup(group.name, switch_group=True)),
        Key([mod, shift], keypad[index], lazy.window.togroup(group.name, switch_group=True))
        
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, shift], i.name, lazy.window.togroup(i.name)),    
    ]
    
    # add group keys to keys.
    keys.extend(group_keys)


# Drag floating layouts.
left_click = "Button1" 
middle_click = "Button2"
right_click = "Button3"

mouse = [
	Drag([mod], left_click, lazy.window.set_position_floating(), start=lazy.window.get_position()),
	Drag([mod], right_click, lazy.window.set_size_floating(), start=lazy.window.get_size()),
	Click([mod], middle_click, lazy.window.bring_to_front())
]
