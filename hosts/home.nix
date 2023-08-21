{ config, lib, pkgs, ... }:
{ 
  imports =
  [(import ../modules/programs/exa)]
  ++ [(import ../modules/programs/fish)]
  ++ [(import ../modules/programs/git)]
  ++ [(import ../modules/programs/starship)];

  home = {
    username = "susan";
    homeDirectory = "/home/susan";

    packages = with pkgs; [
      prismlauncher
      firefox
      signal-desktop
      yubioath-flutter
      skypeforlinux
      discord
      pavucontrol
      emacs29-pgtk
      pinentry-curses
      fuzzel
    ];
    # pointerCursor = {                         # This will set cursor system-wide so applications can not choose their own
    #  gtk.enable = true;
    #  #name = "Dracula-cursors";
    #  name = "Catppuccin-Mocha-Dark-Cursors";
    #  #package = pkgs.dracula-theme;
    #  package = pkgs.catppuccin-cursors.mochaDark;
    #  size = 16;
    # };
    stateVersion = "23.05";
  };

  programs = {
    home-manager.enable = true;
    fish.enable = true;
    neovim.enable = true;
  };

  #gtk = {                                     # Theming
  #  enable = true;
  #  theme = {
  #    name = "Gruvbox-Dark";
  #    package = pkgs.gruvbox-dark-gtk;
  #  };
  #  iconTheme = {
  #    name = "Papirus-Dark";
  #    package = pkgs.papirus-icon-theme;
  #  };
  #  font = {
  #    name = "FiraCode Nerd Font Mono Medium";
  #  };                                        # Cursor is declared under home.pointerCursor 
  #};
}
