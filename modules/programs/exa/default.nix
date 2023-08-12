{config, lib, pkgs, ... }:
{
  programs.exa = {
    enable = true;
    git = true;
    icons = true;
    enableAliases = true;
  };
}
