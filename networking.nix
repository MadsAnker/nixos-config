{ pkgs, ... }:

{
  networking = {
    hostName = "mads";

    networkmanager = {
      enable = true;
      plugins = with pkgs; let my_networkmanager-openconnect = gnome.networkmanager-openconnect.overrideAttrs (old: {
        version = "git";
        src = fetchurl {
          url = "https://gitlab.gnome.org/GNOME/NetworkManager-openconnect/-/archive/main/NetworkManager-openconnect-main.tar.gz";
          sha256 = "sha256-ewtA4LXdKB3oQsc6Teyn9YblIWvPCaCOfosoX1l3xN4=";
        };
        nativeBuildInputs = old.nativeBuildInputs ++ [ 
          autoreconfHook 
        ];
        buildInputs = old.buildInputs ++ [
          webkitgtk
        ];
      });
      in [
        my_networkmanager-openconnect
      ];
    };
  };
}

