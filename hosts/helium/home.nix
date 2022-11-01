{ config, lib, pkgs, ... }:

{
  imports = [ ../../home.nix ../../modules/desktop ];

  desktop = {
    river = {
      enable = true;
      autostart = true;
    };
    waybar = {
      temperaturePath = "/sys/module/k10temp/drivers/pci:k10temp/0000:00:18.3/hwmon/hwmon0/temp1_input";
      keyboardPath = "/dev/input/event3";
    };
  };

  programs.kitty.font.size = 12;
}
