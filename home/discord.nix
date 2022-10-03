{ config, pkgs, ...}:

{
  home.file."discord-config" = {
    target = "./.config/discord/settings.json";
    text = ''
    {
      "SKIP_HOST_UPDATE": true
    }
    '';
  };
}
