{ pkgs, ... }: {
  # Enable asusd
  services.asusd = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    # Enable nvidia-offload custom package
    # nvidia-offload
    # Enable supergfxctl toggle mode custom package
    switch-gfx-mode
  ];
}
