{ config, lib, pkgs, ... }:
{
  services = {
    imports = [(import ./syncthing)]:
  };
}
