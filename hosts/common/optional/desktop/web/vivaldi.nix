{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    vivaldi
    vivaldi-ffmpeg-codecs
    widevine-cdm
  ];
}
