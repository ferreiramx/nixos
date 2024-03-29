{ inputs, vars, ... }: {
  xdg.configFile."eww/css/osd.scss".text = ''
    .osd-part {
      @include window;
      background: $bg;
      margin: 0 .5rem .5rem;

      label {
        color: $text;
        font-size: 2rem;
        margin: 0 .1rem 0 .2rem;
      }

      scale {
        margin: -.2rem 0;
      }

      trough {
        @include rounding;
        background-color: $bg3;
        margin: 1rem 0 .5rem;
        min-height: 10rem;
        min-width: .7rem;

        highlight {
          @include rounding;
          min-width: 0;
        }
      }
    }

    .osd-volume highlight {
      background-image: linear-gradient(to top, $fg4, $fg4);
    }

    .osd-brightness highlight {
      background-image: linear-gradient(to top, $fg4, $fg4);
    }
  '';
}
