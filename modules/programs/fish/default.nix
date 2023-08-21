{config, lib, pkgs, ...}:
{
  programs.fish = {
    enable = true;
    shellAliases = {
      "rebuild" = "sudo nixos-rebuild switch --flake .";
      "flake-check" = "nix flake check";
    };
    shellInit = "set -g fish_greeting";
  };
}
