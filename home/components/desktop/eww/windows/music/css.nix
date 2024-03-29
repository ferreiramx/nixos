{ inputs, vars, ... }: {
  xdg.configFile."eww/css/music.scss".text = ''
    .song-cover-art {
      @include rounding;
      background-position: center;
      background-size: cover;
      margin: 4px 5px 4px 0;
      min-height: 24px;
      min-width: 24px;
    }

    .music-window {
      @include window;
      background-color: $bg;
      border: 1px solid $border;
      color: $fg;
    }

    .music-cover-art {
      background-position: center;
      background-size: cover;
      
      margin: 1em;
      min-height: 170px;
      min-width: 170px;
    }

    .music-box {
      margin: 1rem 1rem 1rem 0;
    }

    .music-title {
      font-size: 1.1rem;
      font-weight: bold;
    }

    .music-artist {
      color: $fg1;
    }

    .music-button label {
      color: $fg1;
      font-size: 2rem;
    }

    .music-time {
      color: $fg1;
      margin: 0 1rem;
    }

    .music-bar scale {
      highlight {
        background-image: linear-gradient(to right, $fg4, $fg4);
        border-radius: 24px;
      }

      trough {
        background-color: $bg3;
        border-radius: 24px;
        margin-top: 0;
        min-height: 10px;
        min-width: 170px;
      }
    }
  '';
}
