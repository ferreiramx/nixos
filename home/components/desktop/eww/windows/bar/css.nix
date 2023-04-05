{ inputs, vars, ... }: {
  xdg.configFile."eww/css/bar.scss".text = ''
    @mixin rounding {
      border-radius: 16px;
    }

    @mixin window {
      margin: 5px 5px 5px;
      @include rounding;
    }

    * {
      all: unset;
      font-family: "Source Sans Pro Semibold", "Jost *", Roboto, sans-serif;
      transition: 200ms ease;
    }

    .bar {
      background-color: $bg;
      color: $fg;

      label {
        font-size: 1rem;
      }
      @include rounding;
    }

    tooltip {
      background: $bg;
      border: 1px solid $border;
      border-radius: 8px;

      label {
        font-size: 1rem;
      }
    }

    .icon,
    .icon label { 
      font-family: Material Symbols Outlined; 
      font-weight: bold;
    }

    .module { margin: 0 5px; }

    .hour {
      font-weight: bold;
      padding-left: 10px;
    }

    .minute {
      font-weight: bold;
      padding-right: 10px;
    }

    .date {
      background: $bg;
      color: $fg;

      label {
        font-weight: bold;
        font-size: 1.2rem;
      }
    }

    .bright-icon { color: $fg1; }
    .module-bt { font-size: 1.2rem; }

    scale trough {
      background-color: $bg3;
      border-radius: 24px;
      margin: 0 1rem;
      min-height: 10px;
      min-width: 70px;
    }

    .workspaces { margin-left: 10px; }
  '';
}
