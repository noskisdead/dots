{ config, pkgs, ... }:

{
  # Install wl-clipboard as it is a cliphist dependency
  home.packages = with pkgs; [
    wl-clipboard
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
    extraOptions = [
      "-max-dedupe-search"
      "10"
      "-max-items"
      "100"
    ];
  };
}
