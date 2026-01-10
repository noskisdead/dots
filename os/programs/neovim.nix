{ config, pkgs, ... }:

{
  programs.nvf.enable = true;
  programs.nvf.settings.vim = {
    vimAlias = true;
    options = {
      softtabstop = 2;
      tabstop = 2;
      shiftwidth = 2;
    };
  };
}
