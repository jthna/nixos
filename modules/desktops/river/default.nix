{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.desktops.river;
in
{
  imports = [ ../waybar.nix ];

  options.desktops.river = {
    enable = mkEnableOption "river desktop";
    autostart = mkOption {
      type = types.bool;
      default = false;
    };
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      grim
      river
      rivercarro
      slurp
      swaybg
      wl-clipboard
      wofi
    ];

    xdg.configFile = {
      "river" = {
        source = ../../../config/river;
        recursive = true;
      };

      "wofi/style.css" = {
        source = ../../../config/wofi/style.css;
      };

      # Power menu script.
      "wofi/power-menu.sh" = {
        source = ../../../config/wofi/power-menu.sh;
        executable = true;
      };

      # Autostart river from tty1.
      "fish/conf.d/river.fish" = mkIf cfg.autostart {
        source = ../../../config/fish/river.fish;
        executable = true;
      };
    };
  };
}
