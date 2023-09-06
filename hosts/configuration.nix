{ config, lib, pkgs, ... }:
{
  time.timeZone = "Europe/Bucharest";

  boot.kernelPackages = pkgs.linuxPackages_latest;

  security.polkit.enable = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
    font-awesome
    fira
  ];

  services = {
    udev.packages = [ pkgs.yubikey-personalization ];
    pcscd.enable = true;
    pipewire = { 
      enable = true;
      pulse.enable = true;
    }; 
  };

  users = {
   mutableUsers = false; 
   defaultUserShell = pkgs.fish;
   users.susan = {
     isNormalUser = true;
     extraGroups = [ "wheel" "video"];
     hashedPassword = "$6$vru/Kz/2RFnBeCXQ$FPDE/DET/P2pNfE2bpVsEdDCeMegmeMApE4l3m/2YR9t6qCSrdiTzqUr8aN1gnOTAcYXBQ30NUf3UtqxINmDL.";
   };
 };

  environment.systemPackages = with pkgs; [ ];

  programs = {
    dconf.enable = true;
    fish.enable = true;
  };

  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 15d";
    };
  };

  networking.networkmanager.enable = true;

  system = {
    #autoUpgrade = {
    #  enable = true;
    #  dates = "02:00";
    #  persistent = true;
    #  flake = "github:susanthenerd/dotfiles";
    #  allowReboot = true;
    #  rebootWindow = {
    #    lower = "02:00";
    #    upper = "04:00";
    #  };
    #}; 
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "23.05"; # Did you read the comment?
  }; 
}
