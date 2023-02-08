{ inputs, lib, config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    whatsapp-for-linux
  ];
}
