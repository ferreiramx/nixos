{ inputs, vars, ... }: {
  xdg.configFile."eww/css/calendar.scss".text = ''
    .calendar-win {
      @include window;
      background-color: $bg;
      color: $fg;
      padding: .2em;
    }

    calendar {
      padding: 5px;

      :selected {
        color: $highlight1;
      }

      .header {
        color: $highlight1;
      }

      .highlight {
        color: $highlight2;
        font-weight: bold;
      }

      .button {
        color: $accent1;
      }

      :indeterminate {
        color: $overlay0;
      }
    }
  '';
}
