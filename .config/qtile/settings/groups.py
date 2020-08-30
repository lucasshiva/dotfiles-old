from libqtile.config import Group, Match

groups = [
    Group("Web", matches=[Match(wm_class=["firefox"])], layout="max"),
    Group("Terminal"),
    Group("Code"),
    Group("Music", matches=[Match(wm_class=["Spotify"])]),
    Group("Files", matches=[Match(wm_class=["thunar"])]),
    Group("Extra")
]
