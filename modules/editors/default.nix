{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacsNativeComp
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      gitsigns-nvim
      gruvbox-material
      nvim-tree-lua
      nvim-treesitter
      telescope-nvim
    ];
  };

  xdg.configFile."nvim" = {
    source = ./config/nvim;
    recursive = true;
  };
}
