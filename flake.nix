{
  description = "My splendid NixOS configuration.";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    emacs-overlay.url = "github:nix-community/emacs-overlay";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ nixpkgs, ... }:
    let
      system = "x86_64-linux";

      overlays = import ./overlays { inherit inputs; };

      pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
      };

      lib = import ./lib { inherit inputs; };
    in {
      nixosConfigurations = with lib; {
        helium = mkHost {
          hostName = "helium";
          inherit system pkgs lib;
        };

        neon = mkHost {
          hostName = "neon";
          inherit system pkgs lib;
        };
      };
    };
}
