{config, pkgs, lib, ... }:
{ 
  services.syncthing = {
    enable = false;
    openDefaultPorts = true;
    user = "susan";
    dataDir = "/data/syncthing";
    configDir = "/data/.config/syncthing"; # I don't have any special configurations, but I'm letting this option here in case I forget about it 
  };
}
