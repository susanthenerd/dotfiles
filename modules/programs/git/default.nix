{config, lib, pkgs, ...}:
{
  programs.git = {
    enable = true;
    userName = "Susan";
    userEmail = "susan@susan.lol";
  };
}
