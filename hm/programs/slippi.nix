{inputs, ...}: {
  imports = [inputs.slippi.homeManagerModules.default];

  slippi-launcher = {
    isoPath = "/home/kenny/Documents/Games/ROMs/Melee.iso";
    launchMeleeOnPlay = false;
  };
}
