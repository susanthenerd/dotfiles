{ config, pkgs, lib, ... }:
{
  security.pam = {
    u2f = {
      control = "requisite";
      cue = true;
    };
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };
  imports = [(import ./hardware-configuration.nix)] ++ [(../../modules/services/syncthing)];
  
  programs = {
    light.enable = true;
  };

  networking.hostName = "framework";

  services = {
    # tlp.enable = true;                      # TLP and auto-cpufreq for power management    
    auto-cpufreq.enable = true;
    # blueman.enable = true;
  };
  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
}
