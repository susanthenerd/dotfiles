{config, lib, pkgs, ... }:
{
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "foot"; 
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
      ];
      output = {
        eDP-1 = {
          scale = "1";
	};
      };
    };
  };
}
