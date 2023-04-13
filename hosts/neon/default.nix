{ pkgs, ... }:
let
  mainDesktop = "hyprland";
  mainEditor = "codium";
in
{
  imports = [ ./hardware-configuration.nix ];

  modules = {
    desktop = {
      ${mainDesktop} = {
        enable = true;
        autostart = true;
      };
      waybar = {
        mainDesktop = "${mainDesktop}";
        temperaturePath =
          "/sys/module/k10temp/drivers/pci:k10temp/0000:00:18.3/hwmon/hwmon3/temp1_input";
      };
      applications = {
        browsers.enable = true;
        gaming.enable = true;
        media.enable = true;
      };
    };

    editors = {
      inherit mainEditor;
      helix.enable = true;
      neovim.enable = true;
      vscode.enable = true;
    };

    dev.enable = true;
    shell.enable = true;
    theme.enable = true;
    hardware.bluetooth.enable = true;
  };

  # General settings.
  services = {
    tlp.enable = true;

    kmonad = {
      enable = true;
      keyboards.default = {
        device = "/dev/input/by-path/platform-i8042-serio-0-event-kbd";
        defcfg = {
          enable = true;
          fallthrough = true;
        };
        config = builtins.readFile ../../config/kmonad/config.kbd;
      };
    };
  };

  # Home-manager settings.
  hm = {
    packages = with pkgs; [ brightnessctl ];
    programs.kitty.font.size = 14;
  };

  # Custom defined options.
  hardware.hasBattery = true;
}
