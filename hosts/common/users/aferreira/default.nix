{ pkgs, config, ... }:
let ifTheyExist = groups: builtins.filter (group: builtins.hasAttr group config.users.groups) groups;
in
{
  users.users.aferreira = {
    isNormalUser = true;
    description = "Angel Ferreira";
    homeMode = "755";
    shell = pkgs.fish;
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
      "audio"
    ]
    ++ ifTheyExist [
      "network"
      "docker"
      "git"
      "libvirtd"
      "kvm"
    ];
    packages = [ pkgs.home-manager ];
    hashedPasswordFile = config.sops.secrets.aferreira.path;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyJu4cqEdzyqCaIkPwojenrdXIZ6x47er4a9l3HxV7D3YpZDWYi/+9/7LYuZ/z6iN5PlvqdkRm7tPIkaIzDHuRWuGQSP3oU9z92YATDzpG85r/DKtAWGAqk+Cd8Ku42EonF6hZtBNsTLTqTRQeqxeJ7/D3f4/9HNjdZT/QztaispuBwROL/S9v9rc04nXVqvZC5ngBpS0/7FGJnMeK2W3pS3NE909luD156cUpklH3zwQTGBl/+SLX4dbpIIoukO0/qeQkGfbzAI8XVQ9v7f67V+dvTsQF9wBRyxyYk3rH/YV+mpX2mHj0qPjZFGYDF96PtgyOYVYYw3fuPKfvPY30NGT7mCGobdwuFGaawHZiKCwd1g36R76Azv3/b1MxnofjdjEXhJeosmRJhALBcOEbgQIzW6vB9gkzMppYGnPK+hKvE5yGGHnHhirUMZaniidmhFBXLIJpfwO39CT/MxaxPUTXJPLHZVTtW12cvMeB76bGl8WUmMUuXYJAWiX7lv8= aferreira" # kiryu
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDI5Cd7I/0md5zQ51NFlkZj7Bh6AUoBT3JH1N+Bpyct7i6ckqD9ZyQq3xdovAZ4YQr3aC1K4PFcjWXdTuV4nyen+UvKzkv0HUo/bK9XFGBS85o9c2CAFAD5ou3bMdN8ViZymvhNK3CiCF+vO8zcy/DYPgwlcdARDF22sJ+4kYfMphb4Pt3vfLW82HZ+Cqo0sk9keemTEuUlda6DNj9VhRgzehlNoTWL301NNsc9fEt7BL8jEDCKQJPspnG7oV6xxeCFMvpgwc8qjTgL9EOejv844Hksbemln9If1RiEniUb9YjOU7LqqvDiIajIZVBz+9ibyB+m4gYqz+yZCbzOf91YlQzznBgCEZ29eAMTy7j0hsKspifCfgGeQs5degRjA6lMUKabFueeX8vbkO40tK0qIj1bSlSetEko9u9Lj8C8Ry8fpaIEzkE6KlyHfQtRrc9T0zDLE9SiPDEOx4aNQFLJLBdZEWhWLVcAL/j4mNYop/nQ3b8Nf+kFF4ZeR2DYCCs= aferreira" # mugendramon
    ];
  };
  sops.secrets.aferreira.neededForUsers = true;
  sops.secrets.github.owner = "aferreira";
  home-manager.users.aferreira = import ../../../../home/${config.networking.hostName}.nix;
}
