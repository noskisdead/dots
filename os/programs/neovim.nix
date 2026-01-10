{ config, pkgs, ... }:

{
  programs.nvf = {
    enable = true;
    settings.vim = {
      viAlias = false;
      vimAlias = true;
      lsp = {
        enable = true;
      };
      theme = {
      	transparent = true;
      };
    };
  };
}
