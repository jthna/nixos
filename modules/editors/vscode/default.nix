{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.modules.editors.vscode;

  configFile = import ./config.nix;
  userSettings = configFile.userSettings;
  keybindings = configFile.keybindings;
in {
  options.modules.editors.vscode.enable = mkEnableOption "vscode";

  config = mkIf cfg.enable {
    hm.programs.vscode = {
      inherit userSettings keybindings;
      enable = true;
      package = pkgs.vscodium;
      extensions = with pkgs.vscode-extensions; [
        jnoortheen.nix-ide
        matklad.rust-analyzer
        pkief.material-icon-theme
        vscodevim.vim
        jdinhlife.gruvbox
      ];
    };
  };
}
