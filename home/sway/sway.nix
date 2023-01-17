{ lib, ... }:

{
  wayland.windowManager.sway =
    let
      extraConfig = (builtins.readFile ./config);
    in
    {
      enable = true;
      wrapperFeatures.gtk = true;
      extraConfig = extraConfig;

      # Not sure what all of these are for, but i have had issues with the _JAVA one before
      extraSessionCommands = ''
        export SDL_VIDEODRIVER=wayland
        export QT_QPA_PLATFORM=wayland
        export QT_WAYLAND_DISABLE_WINDOWDECORATION="1"
        export _JAVA_AWT_WM_NONREPARENTING=1
        export MOZ_ENABLE_WAYLAND=1 '';

      config =
        let
          modkey = "Mod4";
          browser = "brave";
        in
        {
          modifier = modkey;
          terminal = "alacritty";
          menu = "ulauncher";
          bars = [{
            fonts.size = 15.0;
            command = "waybar";
            position = "top";
          }];

          gaps = {
            inner = 10;
          };

          input = {
            "*" = {
              xkb_layout = "dk";
              xkb_options = "caps:swapescape";
              xkb_variant = "nodeadkeys";
              natural_scroll = "enabled";
            };
          };
          window.border = 0;

          output = {
            "*" = {
              background = "/home/mads/Pictures/xp.jpg fill";
            };
          };


          keybindings = lib.mkOptionDefault {
            "${modkey}+Shift+o" = "output eDP-1 disable";
            "${modkey}+Shift+i" = "output eDP-1 enable";
            "${modkey}+s" = "scratchpad show";
            "${modkey}+Shift+s" = "move scratchpad";
            "${modkey}+Shift+l" = "exec swaylock -f -c 000000";
            "${modkey}+x" = "exec ${browser}";
            "${modkey}+Shift+x" = "exec mkdir -p ~/screenshots && grim -t jpeg -g \"$(slurp)\" ~/screenshots/$(date +%Y-%m-%d_%H-%m-%s).jpg";
            "${modkey}+Shift+p" = "exec systemctl suspend";
            "F6" = "exec light -A 5";
            "F5" = "exec light -U 5";
          };
        };
    };
}
