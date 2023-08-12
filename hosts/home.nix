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
      # yubioath-flutter
      # skypeforlinux
      pavucontrol
      emacs29-pgtk
      pinentry-curses
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

  xdg.enable = true;

  programs = {
    home-manager.enable = true;
    fish.enable = true;
    neovim.enable = true;
  };

  # gtk = {                                     # Theming
  #  enable = true;
  #  theme = {
  #    #name = "Dracula";
  #    name = "Catppuccin-Mocha-Compact-Blue-Dark";
  #    #package = pkgs.dracula-theme;
  #    package = pkgs.catppuccin-gtk.override {
  #      accents = ["blue"];
  #      size = "compact";
  #      variant = "mocha";
  #    };
  #  };
  #  iconTheme = {
  #    name = "Papirus-Dark";
  #    package = pkgs.papirus-icon-theme;
  #  };
  #  font = {
  #    #name = "JetBrains Mono Medium";
  #    name = "FiraCode Nerd Font Mono Medium";
  #  };                                        # Cursor is declared under home.pointerCursor 
  # };
}
