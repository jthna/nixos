{ config, lib, pkgs, ... }:
let
  mainDesktop = "hyprland";
in
{
  desktop = {
    ${mainDesktop} = {
      enable = true;
      autostart = true;
    };
    waybar = {
      mainDesktop = "${mainDesktop}";
      enableBatteryModule = true;
      temperaturePath = "/sys/module/k10temp/drivers/pci:k10temp/0000:00:18.3/hwmon/hwmon3/temp1_input";
    };
  };

  dev.enable = true;
  theme.enable = true;
  media.enable = true;
  editors.neovim.enable = true;
}
