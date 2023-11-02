{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    oversteer
    usb-modeswitch
    usb-modeswitch-data
  ];
  services.udev.packages = with pkgs; [ usb-modeswitch-data ];
  environment.etc."usb_modeswitch.d/046d:c261".text = ''
  # Logitech G920 Racing Wheel
  DefaultVendor=046d
  DefaultProduct=c261
  MessageEndpoint=01
  ResponseEndpoint=01
  TargetClass=0x03
  MessageContent="0f00010142"
  '';
}
