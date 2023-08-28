{config, lib, pkgs, ... }:
let  
  myEmacs = pkgs.emacsWithPackagesFromUsePackage {                                      
    config = ./config.el;                                                               
    defaultInitFile = true;                                                             
    package = pkgs.emacs-pgtk;                                                          
  };  
in
{
  programs.emacs = {
    enable = true;
    package = myEmacs;
  };
  services.emacs = {
    enable = true;
    package = myEmacs;
    client.enable = true;
    defaultEditor = true;
  };
}
