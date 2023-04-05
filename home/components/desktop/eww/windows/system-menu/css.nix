{ inputs, vars, ... }: {
  xdg.configFile."eww/css/system.scss".text = ''
        .membar {
          color: $highlight1;
        }

        .cpubar {
          color: $highlight2;
        }

        .batbar {
          color: $highlight3;
        }

        .membar,
        .cpubar,
        .batbar {
          background-color: $bg1;
        }

        .iconmem {
          color: $highlight1;
        }

        .iconcpu {
          color: $highlight2;
        }

        .icon-text {
          font-size: 3rem;
          padding: .7rem;
        }

        .sys-text-sub {
          color: $text;
        }

        .sys-text-mem,
        .sys-text-cpu,
        .sys-text-cpu-temp,
        .sys-text-gpu-temp {
          font-size: 1rem;
          font-weight: bold;
        }

        .sys-icon-mem,
        .sys-icon-cpu,
        .sys-icon-cpu-temp,
        .sys-icon-gpu-temp {
          font-size: 1.5rem;
          margin: 1.5rem;
        }

        .system-info-box {
          @include rounding;
          background-color: $bg1;
          margin: .5rem 1rem;
          padding: .5rem;
        }

        .sys-mem,
        .sys-cpu,
        .sys-cpu-temp,
        .sys-gpu-temp, {
          background-color: $bg;
        }

        .sys-icon-cpu,
        .sys-text-cpu,
        .sys-cpu {
          color: $highlight1;
        }

        .sys-icon-mem,
        .sys-text-mem,
        .sys-mem {
          color: $highlight2;
        }

        .sys-icon-cpu-temp,
        .sys-text-cpu-temp,
        .sys-cpu-temp {
          color: $highlight4;
        }

        .sys-icon-gpu-temp,
        .sys-text-gpu-temp,
        .sys-gpu-temp {
          color: $highlight5;
        }

        .sys-box {
          margin: .3em;
          box { margin-left: 1rem; }
        }
        .system-menu-box {
          @include window;
          background-color: $bg;
          color: $text;
        }

      .separator {
        font-size: 1rem;
      }

      .top-row {
        margin: 1rem 1.5rem 0;

        .time { font-size: 2rem; }

        .date-box {
          margin: 0 1rem;

          label { font-size: 1.1rem; }

          .date {
            background: unset;
            margin: 0 .5rem 0 0;
            padding: 0;
          }
        }
      }

    .system-row {
      margin: .5rem .7rem;

      .airplane-box button {
        padding: 1rem 3rem;
      }

      label {
        font-size: 1rem;
        margin: 0 .1rem;
      }
    }

    .element {
      @include rounding;
      background-color: $bg1;
      margin: .3rem;

      button {
        @include rounding;
        padding: 1rem;

        label {
          font-size: 1.5rem;
        }

        &:hover {
          background-color: rgba(255, 255, 255, 0.1);
        }
      }
    }

    .sliders {
      @include rounding;
      background-color: $bg1;
      margin: .5rem 1rem;
      padding: .6rem 1rem;

      scale {
        margin-right: -1rem;
        min-width: 21.5rem;

        trough { margin-right: 0; }
      }

      box { margin: .2rem 0; }
      label { font-size: 1.2rem; }
    }

    .volume-icon {
      color: $highlight1;
    }

    .volume-slider-box,
    .brightness-slider-box {
      trough { background-color: $accent4; }
    }

    .volume-bar highlight {
      @include rounding;
      background-image: linear-gradient(to right, $highlight1, $highlight1);
    }

    .brightness-slider-box scale highlight {
      @include rounding;
      background-image: linear-gradient(to right, $highlight1, $highlight1);
    }

    .bottom-row {
      margin: .5rem 1rem;

      .battery-icon { font-size: 2rem; }
      .battery-wattage { color: $highlight3; }

      .battery-status {
        color: $subtext0;
        margin: 0 .5rem;
      }

      button {
        background-color: $bg1;
        border-radius: 50%;
        margin-bottom: .1rem;
        padding: 0 .5rem;

        label { font-size: 1.5rem; }
        &:hover { background-color: $bg1; }
      }
    }

    .bt-connected {
      background-color: $highlight1;
      color: $crust;

      button:hover { background-color: rgba(0, 0, 0, .1); }
    }

    .wifi-connected {
      background-color: $highlight2;
      color: $crust;

      button:hover { background-color: rgba(0, 0, 0, .1); }
    }
  '';
}
