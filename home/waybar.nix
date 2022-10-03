{config, pkgs, ...}:

{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        height = 30;
        modules = {
          "network" = {
            "format-wifi" = "{essid}";
            "format-disconnected" = "not connected";
          };
          "clock" = {
            "format" = "{:%H:%M}";
          };
        };
        modules-left = [ "sway/workspaces" "sway/mode" ];
        modules-right = [ "network" "backlight" "pulseaudio" "battery" "clock" ];
      };
    };
  };
}
