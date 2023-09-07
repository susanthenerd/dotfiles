{config, lib, pkgs, ...}:
{
  imports = [(../fzf)];
  
  programs.fish = {
    enable = true;
    shellInit = "set -g fish_greeting";
  };
}
