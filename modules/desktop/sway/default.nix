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
      bars = [];
      gaps = {
        outer = 5;
        inner = 2;
        smartBorders = "on";
      };
      keybindings = {
        #Launch stuff
        "${modifier}+Return" = "exec ${pkgs.foot}/bin/foot";
        # Windows
        "${modifier}+Shift+c" = "kill";
        #Workspaces
        "${modifier}+1" = "workspace number 1";
        "${modifier}+2" = "workspace number 2";
        "${modifier}+3" = "workspace number 3";
        "${modifier}+4" = "workspace number 4";
        "${modifier}+5" = "workspace number 5";
        "${modifier}+6" = "workspace number 6";
        "${modifier}+7" = "workspace number 7";
        "${modifier}+8" = "workspace number 8";
        "${modifier}+9" = "workspace number 9";

        "${modifier}+Shift+1" = "move container to workspace number 1";                                                               
      	"${modifier}+Shift+2" = "move container to workspace number 2";                                                               
      	"${modifier}+Shift+3" = "move container to workspace number 3";                                                               
   	"${modifier}+Shift+4" = "move container to workspace number 4";                                                               
      	"${modifier}+Shift+5" = "move container to workspace number 5";                                                               
      	"${modifier}+Shift+6" = "move container to workspace number 6";                                                               
      	"${modifier}+Shift+7" = "move container to workspace number 7";                                                               
      	"${modifier}+Shift+8" = "move container to workspace number 8";                                                               
      	"${modifier}+Shift+9" = "move container to workspace number 9";
        #Other keybindings
      };
      output = {
        eDP-1 = {
          scale = "1";
	};
      };
    };
  };
}
