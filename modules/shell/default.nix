{ config, lib, pkgs, ... }:
with lib;
let cfg = config.modules.shell;
in {
  options.modules.shell.enable = mkEnableOption "shell";

  config = mkIf cfg.enable {
    programs.fish.enable = true;

    hm = {
      packages = with pkgs; [
        bat
        fd
        killall
        neofetch
        ripgrep
        unzip
        zip
        xdotool
      ];

      programs = {
        fish = {
          enable = true;
          shellAliases = {
            g = "git";
            v = if config.modules.editors.neovim.enable then "nvim" else "vim";
            cat = "bat --theme ansi";

            ls = "exa -1 --group-directories-first --icons";
            la = "exa -1a --group-directories-first --icons";
            ll = "exa -la --group-directories-first --icons";
            lt = "exa -T --group-directories-first --icons";

            nix-rebuild = " sudo nixos-rebuild switch --flake ~/.config/NixOS";
            nix-fetch = "sudo nix flake update ~/.config/NixOS";
            nix-up = "nix-fetch && nix-rebuild";
            nix-gc = "sudo nix-collect-garbage -d";

            "..." = "cd ../..";
          };
          shellInit = ''
            set fish_greeting
            ${if config.modules.editors.neovim.enable then
              "set -gx EDITOR nvim"
            else
              "set -gx EDITOR vim"}
          '';
        };

        kitty = {
          enable = true;
          font.name = "FiraCode Nerd Font";
          settings = {
            background_opacity = "0.9";
            confirm_os_window_close = "0";
          };
          theme = "Doom One";
        };

        starship = {
          enable = true;
          settings.add_newline = true;
        };

        zoxide.enable = true;
      };
    };
  };
}
