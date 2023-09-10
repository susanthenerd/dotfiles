{ config, lib, pkgs, ... }:
{
  imports = [(import ../../modules/desktop/sway)]
  ++ [(import ../../modules/programs/emacs)]
  ++ [(import ../../modules/programs/foot)]
  ++ [(import ../../modules/programs/mako)];
  programs = {
  };

  home.packages = with pkgs; [
    jetbrains.clion
    android-studio
    firefox
    signal-desktop
    yubioath-flutter
    grim
    slurp
    pavucontrol
    qbittorrent
    fuzzel
  ];
  xdg.enable = true;
}
