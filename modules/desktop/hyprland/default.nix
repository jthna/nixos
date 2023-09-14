{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.desktop.hyprland;

  configFile = import ./config.nix {inherit config pkgs;};
  inherit (configFile) hyprlandConfig;
  autostartConfig = configFile.autostart;
  inherit (configFile) wrappedhl;
in {
  imports = [../eww.nix ../waybar.nix ../wofi.nix ../wlogout.nix];

  options.modules.desktop.hyprland = {
    enable = mkEnableOption "hyprland";
    autostart = mkBoolOpt false;
  };

  config = mkIf cfg.enable {
    modules.desktop = {
      eww.enable = true;
      wofi.enable = true;
      wlogout.enable = true;
    };

    hm = {
      user = {
        imports = [inputs.hyprland.homeManagerModules.default];
        wayland.windowManager.hyprland = {
          enable = true;
          extraConfig = hyprlandConfig;
        };
      };

      packages = with pkgs; [
        wrappedhl
        grim
        slurp
        swaybg
        wl-clipboard
      ];

      configFile = {
        "hypr/autostart.sh" = {
          text = autostartConfig;
          executable = true;
        };

        # Autostart Hyprland from tty1.
        "fish/conf.d/hyprland.fish" = mkIf cfg.autostart {
          source = ../../../config/fish/hyprland.fish;
          executable = true;
        };
      };
    };
  };
}
