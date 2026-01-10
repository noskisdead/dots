{ pkgs, ... }:

{
  home.packages = with pkgs; [
    vesktop # gon switch to equibop once it gets updated in nixpkgs
  ];
}
