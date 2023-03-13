{ config, lib, pkgs, ... }:
with lib;
let cfg = config.modules.dev;
in {
  options.modules.dev.enable = mkEnableOption "development";

  config = mkIf cfg.enable {
    hm = {
      packages = with pkgs; [
        godot
        nil
        nixpkgs-fmt
        python3
        rnix-lsp
        rust-analyzer
        rustup
        lua-language-server
        zig
      ];

      programs = {
        git = {
          enable = true;
          userEmail = "zeapo@pm.me";
          userName = "zeapoz";
          extraConfig = { credential.helper = "store"; };
          aliases = {
            a = "add";
            b = "branch";
            bi = "bisect";
            c = "commit";
            cl = "clone";
            co = "checkout";
            cp = "cherry-pick";
            d = "diff";
            f = "fetch";
            i = "init";
            l = "log";
            m = "merge";
            p = "pull";
            pu = "push";
            r = "reset";
            rb = "rebase";
            rs = "restore";
            s = "status";
            st = "stash";
            sw = "switch";
          };
          delta.enable = true;
        };

        exa.enable = true;
      };
    };
  };
}
