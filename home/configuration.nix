{ pkgs, ...}:

{


  home-manager.users.mads = { pkgs, ... }: {
    programs.bash = let bashrc = builtins.readFile ./bashrc;
    in
    {
      enable = true;
      bashrcExtra = bashrc;
    };

    programs.home-manager.enable = true;

    imports = [
      ./sway/sway.nix
      ./vim/vim.nix
      ./alacritty.nix
      ./waybar.nix
      ./discord.nix
      ./ssh.nix
    ];

    home.stateVersion = "22.11";

    home.packages = let
      pyenv = pyPkgs: with pyPkgs; [
        ipython
        pycryptodome
      ];
      openconnect-sso = (import "${builtins.fetchTarball https://github.com/vlaci/openconnect-sso/archive/master.tar.gz}/nix" {}).openconnect-sso;
    in with pkgs; [
      swaylock # Locking
      swayidle # Trigger actions on idle
      alacritty # Alacritty is the default terminal in the config
      waybar # Top bar
      font-awesome # Nice fonts
      brave #Browser
      pavucontrol # PuleAudio Volume Control (or something like that)
      spotify
      ulauncher # Launcher app 
      blueman
      discord
      (python310.withPackages pyenv)
      zathura # View pdfs
      postman
      microsoft-edge
      pandoc
      texlive.combined.scheme-full
      libqalculate # qalc programs
      signal-desktop
      # openconnect-sso # For SDU VPN
      slurp # For selecting regions (used with grim for screenshots)
      grim # For taking screenshots
      nodejs-16_x
      wl-clipboard # Used to interact with the wayland clipboard
      xdg-utils #xdg-open is used by many programs
      delta # better diffs with git
      vscode
      # gnome.gnome-keyring
      wireshark

      # So this was a bit of a pain to get working
      # SSO was not working. 
      # Running my browser (chromium based) with strace showed that a call 
      # to xdg-open was being made but failed to find a handler.
      # In serach for a solution i found 
      # https://superuser.com/questions/162092/how-can-i-register-a-custom-protocol-with-xdg.
      # So i looked for the termius-app .desktop file (find -L . -name '*.desktop') 
      # and found termius-app.desktop in ~/.nix-profile/opt/termius/meta/gui/termius-app.desktop.
      # Adding the following to ~/.local/share/applications/mimeapps.list fixed the issue:
      #[Default Applications]
      #x-scheme-handler/termius=termius-app.desktop
      termius
      ghc
      networkmanagerapplet
      obsidian
    ];

    nixpkgs.config.allowUnfree = true;

    programs.mako = {
      enable = true;
      defaultTimeout = 2000;
      backgroundColor= "#1E1D2F";
      textColor = "#D9E0EE";
      borderColor = "#96CDFB";
      progressColor = "over #302D41";

      #borderColor = "#F8BD96";
    };

    services.kanshi = {
      enable = true;
      profiles = {
        "laptop" = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
          ];
        };
        "external" = {
          outputs = [
            {
              criteria = "eDP-1";
              status = "enable";
            }
            {
              criteria = "Lenovo Group Limited LEN P27q-10";
              status = "enable";
            }
          ];
        };
      };
    };


    services.swayidle = {
      enable = true;
      timeouts = [
        {
          timeout = 300;
          command = "swaymsg output '*' dpms off";
          resumeCommand = "swaymsg output '*' dpms on";
        }
      ];
      events = [
        {
          event = "before-sleep";
          command = "swaylock -f -c 000000";
        }
      ];
    };

    programs.git = {
      enable = true;
      userName  = "Mads Anker Nielsen";
      userEmail = "madsanker123@gmail.com";
    };
  };
}
