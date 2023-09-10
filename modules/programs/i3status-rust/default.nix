{config, lib, pkgs, ... }:
{
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        theme = "gruvbox-dark";
        icons = "awesome6";
        blocks = [
          {
            block = "memory";
            format = " $icon $mem_used_percents ";
            format_alt = " $icon SWAP $swap_used_percents ";
          }
          {
            block = "cpu";
            interval = 1;
          }
          {
            block = "load";
            format = " $icon $1m ";
            interval = 1;
          }
          {
            block = "battery";
            format = " $icon $percentage $time $power ";
            interval = 5;
          }
          {
            block = "net";
            format = " $icon ^icon_net_down $speed_down.eng(prefix:M) ^icon_net_up $speed_up.eng(prefix:M) ";
            format_alt = " $icon {$signal_strength $ssid $frequency|Wired connection} $ip ";
          }
          {
            block = "sound";
          }
          {
            block = "backlight";
          }
          {
            block = "time";
            format = " $timestamp.datetime(f:'%a %d/%m %R') ";
            interval = 60;
          }
        ];
      };
    };
  };
}
