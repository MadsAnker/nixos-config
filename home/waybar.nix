{ config, pkgs, ... }:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-right = [ "network" "backlight" "pulseaudio" "battery" "clock" ];
        "network" = {
          "format-wifi" = "{essid} {ipaddr}/{cidr}";
          "format-disconnected" = "not connected";
          "on-click" = "exec nm-applet --indicator";
          };
          "clock" = {
          "format" = "{:%H:%M (%V)}";
          };
          "battery" = {
          "states" = {
          "warning" = 30;
          "critical" = 10;
          };
          "format" = "{capacity}% {icon} ";
          "format-icons" = ["" "" "" "" ""];
          };

          "pulseaudio" = {
            "format" = "{volume}% {icon}";
            "format-icons" = {
              "default" = ["" "" ""];
            };
            "on-click" = "pavucontrol";
          };
        };
      };
    };
 }
