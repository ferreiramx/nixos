{lib}: ''
* {
    background: #151515;
    foreground: #c0c0bc;
    background-color: @background;
    border-color: #202020;
    border: @border-color;
    border-alt: @border-color;
    selected-foreground: #999999ff;
    urgent: #ff0000ff;

    active-background: #151515;
    active-foreground: @foreground;
    normal-background: #1c1c1c;
    normal-foreground: @foreground;
    urgent-background: #151515;
    urgent-foreground: @foreground;

    alternate-active-background: @active-background;
    alternate-active-foreground: @foreground;
    alternate-normal-background: @normal-background;
    alternate-normal-foreground: @foreground;
    alternate-urgent-background: @urgent-background;
    alternate-urgent-foreground: @foreground;

    selected-active-background: #202020;
    selected-active-foreground: @foreground;
    selected-normal-background: #202020;
    selected-normal-foreground: @foreground;
    selected-urgent-background: #6d3636;
    selected-urgent-foreground: @foreground; 
    
    spacing: 2;
}
''