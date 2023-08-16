{ config, lib, pkgs, ... }:
{
  imports = [(import ../../modules/desktop/sway)]
  ++ [(import ../../modules/programs/foot)]
  ++ [(import ../../modules/programs/i3status-rust)];
}
