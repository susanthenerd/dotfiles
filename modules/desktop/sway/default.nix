{config, lib, pkgs, ... }:
{
  imports = [(../../programs/i3status-rust)];
  wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4";
      terminal = "foot";
      startup = [
        # Launch Firefox on start
        {command = "firefox";}
        {command = "signal-desktop";}
      ];
      fonts = {                                                                            
        names = [ "FiraCode Nerd Font Mono" "FontAwesome"];
        style = "Regular";
        size = 11.0;
      };    

      bars = [
        {
          fonts = {
            names = [ "FiraCode Nerd Font Mono" "FontAwesome"];
            style = "Regular";
            size = 11.0;
          };
          position = "bottom";
          statusCommand = "i3status-rs ~/.config/i3status-rust/config-default.toml";
          # colors={
          #  separator = "#666666";
          #  background = "#222222";
          #  statusline = "#dddddd";
          #  focusedWorkspace = {
          #    background = "#0088CC";
          #    border = "#0088CC";
          #    text = "#ffffff";
          #  };
          #  activeWorkspace = {
          #    background = "#333333";
          #    border = "#333333";
          #    text = "#ffffff";
          #  };
          #  inactiveWorkspace = {
          #   background = "#333333";
          #   border = "#333333";
          #   text = "#888888";
          #  };
          #  urgentWorkspace = {
          #    background = "#2f343a";
          #    border = "#900000";
          #    text = "#ffffff";
          #  };
          #};
        }
      ];
      gaps = {
        outer = 0;
        inner = 0;
        # smartBorders = "on";
      };
      keybindings = {
        #Launch stuff
        "${modifier}+Return" = "exec ${terminal}";
        "${modifier}+Shift+b" = "exec firefox";
        "${modifier}+Shift+Return" = "exec fuzzel";

        # Windows
        "${modifier}+Shift+c" = "kill";

        # Layouts
        "${modifier}+b" = "splith";
        "${modifier}+v" = "splitv";

        # Switch the current container between different layout styles
        "${modifier}+s" = "layout stacking";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+e" = "layout toggle split";

        "${modifier}+f" = "fullscreen";

        # Toggle the current focus between tiling and floating mode
        "${modifier}+Shift+space" = "floating toggle";

        # Swap focus between the tiling area and the floating area
        "${modifier}+space" = "focus mode_toggle";

        # Move focus to the parent container
        "${modifier}+a" = "focus parent";

        # Workspaces
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


        "Print" = "exec grim -q 100 ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H-%M-%S' ).png";
        "${modifier}+Print" = "exec slurp | grim -g - -q 100 ~/Pictures/screenshot-$(date +'%Y-%m-%d-%H-%M-%S' ).png";


        # Resize
        "${modifier}+r" = "mode resize";

        # Other keybindings
        "${modifier}+Shift+r" = "reload";
        "${modifier}+Shift+e" = "exec swaynag -t warning -m 'You pressed the exit shortcut. Do you really want to exit sway? This will end your Wayland session.' -b 'Yes, exit sway' 'swaymsg exit'";
      };
      modes = {
        resize = {
          "Down" = "resize grow height 10 px";
          "Escape" = "mode default";
          "Left" = "resize shrink width 10 px";
          "Return" = "mode default";
          "Right" = "resize grow width 10 px";
          "Up" = "resize shrink height 10 px";
          "h" = "resize shrink width 10 px";
          "j" = "resize grow height 10 px";
          "k" = "resize shrink height 10 px";
          "l" = "resize grow width 10 px";
        };
      };

      output = {
        eDP-1 = {
          scale = "1";
        };
        DP-1 = {
          scale = "1";
        };
      };
    };
  };
}
