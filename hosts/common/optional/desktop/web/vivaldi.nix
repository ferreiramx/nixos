{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
    vivaldi-widevine
  ];
}
