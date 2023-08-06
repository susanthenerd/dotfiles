{ lib, inputs, nixpkgs, home-manager, ... }:
let
  system = "x86_64_linux";

  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

  lib = nixpkgs.lib;
in
{
  framework = lib.nixosSystem {
    inherit system;
    modules = [
      ./framework
      ./configuration.nix

      home-manager.nixosModules.home-manager {
        home-manager.useUserPackages = true;
        home-manager.users.susan = {
          imports = [(import ./home.nix)] ++ [(import ./framework/home.nix)];
        };
      } 
    ];
  };
}
