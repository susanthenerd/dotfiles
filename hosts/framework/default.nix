{ config, pkgs, lib, ... }:
{
  imports = [(import ./hardware-configuration.nix)];

  programs = {
    light.enable = true;
  };

  services = {
    #tlp.enable = true;                      # TLP and auto-cpufreq for power management
    auto-cpufreq.enable = true;

    blueman.enable = true;
  };
}
