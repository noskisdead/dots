{pkgs, ...}: {
  home.packages = [
    pkgs.krabby # Pokemon Colorscripts in rust
  ];

  programs.man.generateCaches = false; # Fixes long rebuilds

  programs.eza = {
    enable = true;
    enableFishIntegration = true;
    icons = "auto";
    colors = "auto";
  };

  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableInteractive = true;
    enableTransience = true;
  };

  programs.fish = {
    enable = true;
    shellAbbrs = {
      ani-cli = "ani-cli --skip";
      mkdir = "mkdir -p";
      sl = "ls";
      pdw = "pwd";
      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";
      mv = "mv -i";
      shred = "sudo shred -vzu -n5";
    };
    shellAliases = {
      l = "eza -lh"; # long list
      ls = "eza -1"; # short list
      ll = "eza -lha --sort=name --group-directories-first"; # long list all
      ld = "eza -lhD"; # long list dirs
      lt = "eza --tree"; # list folder as tree
      emacs = "emacs -nw";
      rm = "trash";
    };
    shellInit = ''
      set -g fish_greeting
      fish_hybrid_key_bindings
      krabby random 1,3,4,5,7 --no-mega --no-gmax --padding-left 3
    '';
  };
}
