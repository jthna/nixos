{ config, lib, pkgs, ... }:

{
  imports = [ ../../home.nix ];

  programs.alacritty.settings.font.size = 13;

  # Waybar settings.
  programs.waybar.settings.mainBar = {
    "temperature".hwmon-path = "/sys/module/k10temp/drivers/pci:k10temp/0000:00:18.3/hwmon/hwmon1/temp1_input";
    "keyboard-state".device-path = "/dev/input/event3";
  };
}
