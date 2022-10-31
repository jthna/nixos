{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    emacsNativeComp
    neovide
    neovim-nightly
  ];

  programs.neovim = {
    enable = true;
    package = pkgs.neovim-nightly;
    plugins = with pkgs.vimPlugins; [
      auto-pairs
      bufferline-nvim
      cmp-buffer
      cmp-cmdline
      cmp-nvim-lsp
      cmp-nvim-lsp-signature-help
      cmp-path
      cmp_luasnip
      comment-nvim
      dashboard-nvim
      friendly-snippets
      gitsigns-nvim
      gruvbox-material
      indent-blankline-nvim
      lspkind-nvim
      lualine-nvim
      luasnip
      neogit
      neo-tree-nvim
      nvim-cokeline
      nvim-cmp
      nvim-lspconfig
      nvim-surround
      (nvim-treesitter.withPlugins (plugins: with plugins; [
        tree-sitter-nix
        tree-sitter-lua
        tree-sitter-rust
        tree-sitter-zig
      ]))
      nvim-web-devicons
      plenary-nvim
      project-nvim
      telescope-nvim
      toggleterm-nvim
      which-key-nvim
    ];
  };

  xdg.configFile."nvim" = {
    source = ../../config/nvim;
    recursive = true;
  };
}
