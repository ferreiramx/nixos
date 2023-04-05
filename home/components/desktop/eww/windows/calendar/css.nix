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
        color: $fg4;
      }

      .header {
        color: $fg4;
      }

      .highlight {
        color: $fg3;
        font-weight: bold;
      }

      .button {
        color: $fg1;
      }

      :indeterminate {
        color: $bg3;
      }
    }
  '';
}
