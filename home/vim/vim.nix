{ config, pkgs, ... }:

let
  vimrc = (builtins.readFile ./init.vim);
in
{

  xdg.configFile.nvim = {
    source = ./config;
    recursive = true;
  };

  programs.neovim =
    let
      bettermonokai = pkgs.vimUtils.buildVimPluginFrom2Nix {
        pname = "monokai.nvim";
        version = "2023-01-18";
        src = pkgs.fetchFromGitHub {
          owner = "tanvirtin";
          repo = "monokai.nvim";
          rev = "b8bd44d5796503173627d7a1fc51f77ec3a08a63";
          sha256 = "0gc10p1i9grib93d5hf7nnhbrrri84qb6jn4fqk58bzncdmsbbs3";
        };
        meta.homepage = "https://github.com/tanvirtin/monokai.nvim";
      };
    in
    {
      enable = true;
      withPython3 = true;
      vimAlias = true;

      plugins = with pkgs.vimPlugins; [
        plenary-nvim # Dependency for many plugins
        nvim-tree-lua
        luasnip # snippet engine
        tex-conceal-vim #inline latex rendering for some symbols

        nvim-cmp # completion engine
        cmp-nvim-lsp # lsp source for cmp
        cmp_luasnip # luasnip completion source
        cmp-buffer # buffer completion source
        cmp-path # path completion source

        neodev-nvim # dev setup for init.lua
        nvim-lspconfig # preconfigured language servers

        telescope-nvim # Search everything

        nvim-web-devicons # Icons
        vim-tmux-navigator # Tmux-like navigation
        vim-nix # Nix syntax highlighting
        which-key-nvim # Popup for keybindings
        alpha-nvim # Shlash screen
        copilot-vim
        bufferline-nvim # Fancy buffer navigation
        lightspeed-nvim # Fast cursor movement
        project-nvim # Project management
        lualine-nvim # Statusline
        vimtex # Latex
        gitsigns-nvim # Line highlighting for git changes
        nvim-treesitter.withAllGrammars
        bettermonokai

        telescope-ui-select-nvim # set vim.ui.select to telescope
      ];

      extraConfig = vimrc;

      extraPackages =
        let pyenv = pyPkgs: with pyPkgs; [
          python-lsp-server
          pylint
          pyflakes
          rope
          jedi
        ]; in
        with pkgs; [
          (python310.withPackages pyenv)
          sumneko-lua-language-server
          ripgrep
          fd
          haskell-language-server
          rnix-lsp
        ];
    };
}
