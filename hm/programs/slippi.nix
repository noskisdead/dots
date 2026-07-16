{
  inputs,
  config,
  ...
}: {
  imports = [inputs.slippi.homeManagerModules.default];

  slippi-launcher = {
    enableJukebox = false;
    isoPath = "${config.home.homeDirectory}/Documents/Games/Slippi/Melee.iso";
    rootSlpPath = "${config.home.homeDirectory}/Documents/Games/Slippi";
    useMonthlySubfolders = true;
  };
}
