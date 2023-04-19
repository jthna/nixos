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
        fzf
        killall
        lazygit
        neofetch
        ripgrep
        xdotool
        ranger
        unzip
        zip
        p7zip
        socat
        jq
        jaq
        bc
        wget
      ];

      programs = {
        fish = {
          enable = true;
          shellAliases = {
            g = "git";
            gl = "git log";
            gap = "git add --patch";
            gc = "git commit";
            gs = "git status";
            gpu = "git push";
            gp = "git pull";
            gf = "git fetch";

            v = if config.modules.editors.neovim.enable then "nvim" else "vim";
            r = "ranger";
            cat = "bat --theme ansi";

            nr = "sudo nixos-rebuild switch --flake ~/.config/NixOS";
            nf = "cd ~/.config/NixOS && git pull";
            nup = "nf && nr";
            ngc = "sudo nix-collect-garbage -d";
            nd = "nix develop -c fish";
            ndp = "nix develop --pure-eval -c fish";

            "..." = "cd ../..";
          };
          shellInit = ''
            set fish_greeting
            ${if config.modules.editors.helix.enable then
              "set -gx EDITOR hx"
            else if config.modules.editors.neovim.enable then
              "set -gx EDITOR nvim"
            else
              "set -gx EDITOR vim"}
          '';
          plugins = with pkgs.fishPlugins; [
            {
              name = "tide";
              inherit (tide) src;
            }
            {
              name = "forgit";
              inherit (forgit) src;
            }
            {
              name = "pisces";
              inherit (pisces) src;
            }
            {
              name = "fzf-fish";
              inherit (fzf-fish) src;
            }
          ];
        };

        kitty = {
          enable = true;
          font.name = "FiraCode Nerd Font";
          settings = {
            background_opacity = "0.9";
            confirm_os_window_close = "0";
          };
        };

        zoxide.enable = true;

        exa = {
          enable = true;
          enableAliases = true;
          extraOptions = [ "--group-directories-first" ];
          git = true;
          icons = true;
        };

        wezterm = {
          enable = true;
          extraConfig = ''
            return {
              font = wezterm.font("FiraCode Nerd Font"),
              font_size = 14.0,
              color_scheme = "OneDark (base16)",
              window_background_opacity = 0.9,
              hide_tab_bar_if_only_one_tab = true,
              window_close_confirmation = "NeverPrompt", 
            }
          '';
        };
      };
    };
  };
}
