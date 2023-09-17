{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    qemu_full
    virt-manager
  ];
  virtualisation.spiceUSBRedirection.enable = true;
}
