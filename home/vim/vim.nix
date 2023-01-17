{config, pkgs, ...}:

let
  vimrc = (builtins.readFile ./init.vim);
in
  {

    xdg.configFile.nvim = {
      source = ./config;
      recursive = true;
    };

    programs.neovim = { enable = true;
      withPython3 = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        plenary-nvim # Dependency for many plugins
        nvim-tree-lua
        luasnip # snippet engine

        nvim-cmp # completion engine
        cmp-nvim-lsp # lsp source for cmp
        cmp_luasnip # luasnip completion source
        cmp-buffer # buffer completion source

        neodev-nvim # dev setup for init.lua
        nvim-lspconfig # preconfigured language servers

        telescope-nvim # Search everything

        vim-monokai # Colorscheme
        nvim-web-devicons # Icons
        vim-tmux-navigator # Tmux-like navigation
        vim-nix # Nix syntax highlighting
        which-key-nvim # Popup for keybindings
        alpha-nvim # Shlash screen
        copilot-vim # Autocomplete
        bufferline-nvim # Fancy buffer navigation
        lightspeed-nvim # Fast cursor movement
        project-nvim # Project management
        lualine-nvim # Statusline
        vimtex # Latex
      ];


      extraConfig = vimrc;
  };
}
