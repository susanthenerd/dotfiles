{ config, lib, pkgs, ... }:
{
  imports = [(import ../../modules/desktop/sway)]
  ++ [(import ../../modules/programs/foot)];
  programs = {
    obs-studio.enable = true;
  };
  xdg.enable = true;
}
