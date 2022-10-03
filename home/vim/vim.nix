{config, pkgs, ...}:

let
  ultsnipsDir = ./UltiSnips;
  vimrc = (builtins.readFile ./vimrc);
  coc-settings = (builtins.fromJSON (builtins.readFile ./coc-settings.json));
in
  {
    programs.neovim = {
      enable = true;
      withPython3 = true;
      vimAlias = true;

      coc = {
        enable = true;
        settings = coc-settings;
      };

      plugins = with pkgs.vimPlugins; [
        vim-monokai
        vim-devicons
        vim-nerdtree-syntax-highlight
        vim-tmux-navigator
        ultisnips
        nerdtree
        supertab
        tabular
        vim-table-mode
        vim-nix
        vimtex
        # Coc plugins
        coc-tsserver
        coc-python
        coc-html
      ];

      extraConfig = vimrc;
    };
  }
