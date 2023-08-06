{ config, lib, pkgs, ... }:
{ 
  imports = (import ../modules/programs);

  home = {
    username = "susan";
    homeDirectory = "/home/susan";

    packages = with pkgs; [
      prismlauncher
      firefox
      signal-desktop                                                                                                                                                                                                            
      yubioath-flutter                                                                                                                                                                                                          
      git                                                                                                                                                                                                                       
      emacs29-pgtk                                                                                                                                                                                                              
      neovim                                                                                                                                                                                                                    
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

  programs = {
    home-manager.enable = true;
    fish.enable = true;
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
