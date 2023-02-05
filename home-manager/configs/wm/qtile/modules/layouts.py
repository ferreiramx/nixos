from libqtile import layout
from libqtile.config import Match
from modules.theme import theme

layouts = [
    layout.MonadThreeCol(
        ratio=0.5,
        min_ratio=0.34,
        max_ratio=0.5,
        new_client_position="bottom",
        margin=theme["windows"]["margin"]["x"],
        single_margin=[
            theme["windows"]["margin"]["y"],
            int(theme["screen"]["width"] / 5),
            theme["windows"]["margin"]["y"],
            int(theme["screen"]["width"] / 5),
        ],
        border_width=theme["windows"]["borders"]["width"],
        border_focus=theme["colors"]["bg4"],
        border_normal=theme["colors"]["bg3"],
    ),
    layout.MonadTall(
        ratio=0.7,
        max_ratio=0.75,
        min_ratio=0.5,
        new_client_position="bottom",
        margin=theme["windows"]["margin"]["x"],
        border_width=theme["windows"]["borders"]["width"],
        singel_margin=theme["windows"]["margin"]["x"],
        singel_border_width=theme["windows"]["borders"]["width"],
        border_focus=theme["colors"]["bg4"],
        border_normal=theme["colors"]["bg3"],
    ),
    layout.Columns(
        margin=[
            theme["windows"]["margin"]["y"],
            theme["windows"]["margin"]["x"],
            theme["windows"]["margin"]["y"],
            theme["windows"]["margin"]["x"],
        ],
        num_stacks=3,
        border_width=theme["windows"]["borders"]["width"],
        border_focus=theme["colors"]["bg4"],
        border_normal=theme["colors"]["bg3"],
        num_columns=3,
        split=True,
        fair=False,
    ),
    layout.Stack(
        margin=[
            theme["windows"]["margin"]["y"],
            theme["windows"]["margin"]["x"],
            theme["windows"]["margin"]["y"],
            theme["windows"]["margin"]["x"],
        ],
        num_stacks=3,
        border_width=theme["windows"]["borders"]["width"],
        border_focus=theme["colors"]["bg4"],
        border_normal=theme["colors"]["bg3"],
    ),
    layout.Max(),
]


floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="Picture in Picture"),
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
    border_width=theme["windows"]["borders"]["width"],
    border_focus=theme["colors"]["bg4"],
    border_normal=theme["colors"]["bg3"],
)
