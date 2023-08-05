{ config, lib, pkgs, ... }:
{
  time.timeZone = "Europe/Bucharest";

  services = {
    udev.packages = [ pkgs.yubikey-personalization ];
    pcscd.enable = true;
    pipewire = { 
      enable = true;
      pulse.enable = true;
    }; 
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };

  users = {
    mutableUsers = false; 
    defaultUserShell = pkgs.fish;
    users.susan = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      hashedPassword = "$6$vru/Kz/2RFnBeCXQ$FPDE/DET/P2pNfE2bpVsEdDCeMegmeMApE4l3m/2YR9t6qCSrdiTzqUr8aN1gnOTAcYXBQ30NUf3UtqxINmDL.";
    };
  };

  environment.systemPackages = with pkgs; [
    yubikey-manager
    yubikey-manager-qt
    signal-desktop
    yubioath-flutter
    git
    wl-clipboard
    emacs29-pgtk
    vim
    firefox
    pinentry-curses
  ];
  programs = {
    fish.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
      pinentryFlavor = "curses";
    };
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.networkmanager.enable = true;

  system = { 
    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It's perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "23.05"; # Did you read the comment?
  }; 
}
