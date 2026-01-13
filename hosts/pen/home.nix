{
  home.username = "kenny";
  home.homeDirectory = "/home/kenny";
  home.stateVersion = "25.05"; # do not change

  imports = [
    ./../../hm/importer.nix # Import all your Home Manager modules
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
