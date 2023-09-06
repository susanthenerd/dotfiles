{ lib, inputs, nixpkgs, home-manager, emacs-overlay, ... }:
let
  system = "x86_64_linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;                              # Allow proprietary software
  };

  lib = nixpkgs.lib;
in
{
  framework = lib.nixosSystem {
    inherit system;

    modules = [
      { nixpkgs = {
          overlays = [
            emacs-overlay.overlay
          ];
         config.allowUnfree = true;
        };
      }
      {
        nix.settings = {
          substituters = [
            "https://nix-community.cachix.org"
          ];
          trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          ];
        };
      }

      ./framework
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useUserPackages = true;
        home-manager.useGlobalPkgs = true;

        home-manager.users.susan = {
          imports = [(import ./home.nix)] ++ [(import ./framework/home.nix)];
        };
      } 
    ];
  };
}
