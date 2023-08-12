{ config, lib, pkgs, ... }:
{
  imports = [(import ../../modules/desktop/sway)]
  ++ [(import ../../modules/programs/foot)];
}
