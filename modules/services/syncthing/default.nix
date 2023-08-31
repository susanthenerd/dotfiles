{config, pkgs, lib, ... }:
{ 
  services.syncthing = {
    enable = true;
    openDefaultPorts = true;
    user = "susan";
    dataDir = "/home/susan/phone/";
    configDir = "/home/susan/.config/syncthing"; # I don't have any special configurations, but I'm letting this option here in case I forget about it 
  };
}
