{ pkgs, ... }: {
  # environment.systemPackages = with pkgs; [
  #   qemu_full
  #   virt-manager
  # ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
