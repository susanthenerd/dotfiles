{ lib, inputs, nixpkgs, home-manager, emacs-overlay, ... }:
let
  system = "x86_64_linux";

  lib = nixpkgs.lib;
in
{
  framework = lib.nixosSystem {
    inherit system;

    modules = [
       { nixpkgs.overlays = [
           emacs-overlay.overlay
         ];
         nixpkgs.config.allowUnfree = true;
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
