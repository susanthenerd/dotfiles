{config, lib, pkgs, ...}:
{
  programs.fish = {
    enable = true;
    shellInit = "set -g fish_greeting";
  };
}
