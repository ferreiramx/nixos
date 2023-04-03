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
    ];
    packages = [ pkgs.home-manager ];
    passwordFile = config.sops.secrets.aferreira.path;
    openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCyJu4cqEdzyqCaIkPwojenrdXIZ6x47er4a9l3HxV7D3YpZDWYi/+9/7LYuZ/z6iN5PlvqdkRm7tPIkaIzDHuRWuGQSP3oU9z92YATDzpG85r/DKtAWGAqk+Cd8Ku42EonF6hZtBNsTLTqTRQeqxeJ7/D3f4/9HNjdZT/QztaispuBwROL/S9v9rc04nXVqvZC5ngBpS0/7FGJnMeK2W3pS3NE909luD156cUpklH3zwQTGBl/+SLX4dbpIIoukO0/qeQkGfbzAI8XVQ9v7f67V+dvTsQF9wBRyxyYk3rH/YV+mpX2mHj0qPjZFGYDF96PtgyOYVYYw3fuPKfvPY30NGT7mCGobdwuFGaawHZiKCwd1g36R76Azv3/b1MxnofjdjEXhJeosmRJhALBcOEbgQIzW6vB9gkzMppYGnPK+hKvE5yGGHnHhirUMZaniidmhFBXLIJpfwO39CT/MxaxPUTXJPLHZVTtW12cvMeB76bGl8WUmMUuXYJAWiX7lv8= aferreira"
    ];
  };
  sops.secrets.aferreira.neededForUsers = true;
  sops.secrets.github.owner = "aferreira";
  home-manager.users.aferreira = import ../../../../home/${config.networking.hostName}.nix;
}
