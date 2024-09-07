{ config, vars, ... }:
let
    colors = config.colorScheme.palette;
in
''
@import "~/.config/rofi/theme.rasi"

configuration {
	font:							"Source Sans Pro Regular ${builtins.toString vars.fonts.sans}";
    show-icons:                     true;
	icon-theme: 					"${config.gtk.iconTheme.name}";
    display-drun: 					"";
    drun-display-format:            "{name}";
    disable-history:                false;
	sidebar-mode: 					false;
}

window {
    transparency:                   "real";
    background-color:               @background;
    text-color:                     @foreground;
	border:							0px;
    border-radius:                  12px;
	width:							500px;
    location:                       center;
    x-offset:                       0;
    y-offset:                       0;
}


mainbox {
    background-color:               @background;
	border:							0% 0% 0% 0%;
    border-radius:                  0% 0% 0% 0%;
	border-color:					@border-color;
    children:                       [ inputbar, listview ];
    spacing:                       	0%;
    padding:                        0%;
}

inputbar {
	children: 						[ prompt, entry ];
    background-color:               @background;
    text-color:                     @background;
    expand:                         false;
	border:							0% 0% 0.2% 0%;
    border-radius:                  0px;
	border-color:					@border-color;
    margin:                         0% 0% 5px 0%;
    padding:                        2%;
}

prompt {
    enabled: 						true;
	padding: 						0.30% 1% 0% -0.5%;
	background-color: 				@background;
	text-color: 					@foreground;
	font:							"Source Sans Pro Semibold ${builtins.toString vars.fonts.sans}";
}

entry {
    font:							"Source Sans Pro Semibold ${builtins.toString vars.fonts.sans}";
    background-color:               @background;
    text-color:                     @foreground;
    placeholder-color:              @foreground;
    expand:                         true;
    horizontal-align:               0;
    placeholder:                    "";
    padding:                        0.5% 0% 0.5% 0.25%;
    blink:                          true;
}

listview {
    background-color:               @background;
    padding:                        0px;
    columns:                        1;
    lines:                          5;
    spacing:                        0%;
    cycle:                          false;
    dynamic:                        true;
    layout:                         vertical;
}

element {
    background-color:               @background;
    text-color:                     @foreground;
    orientation:                    horizontal;
    border-radius:                  0%;
    padding:                        1% 0.5% 1% 0.5%;
}

element-icon {
    background-color: 				inherit;
    text-color:       				inherit;
    horizontal-align:               0.5;
    vertical-align:                 0.5;
    size:                           32px;
    border:                         0px;
}

element-text {
    background-color: 				inherit;
    text-color:       				inherit;
    expand:                         true;
    horizontal-align:               0;
    vertical-align:                 0.5;
    margin:                         0% 0.25% 0% 0.25%;
}

element selected {
    background-color:               @selected-normal-background;
    text-color:                     @foreground;
	border:							0.3%;
    border-radius:                  12px;
    border-color:                  	@background;
}
''