{pkgs, ...}: {
  home.packages = with pkgs; [
    krabby # Pokemon Colorscripts in rust
    wget # Download shi
  ];

  programs = {
    man.generateCaches = false; # Fixes long rebuilds

    bat = {
      enable = true;
      config.theme = "Catppuccin Macchiato";
      themes.catppuccin-macchiato = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "6810349b28055dce54076712fc05fc68da4b8ec0"; # or a specific commit
          sha256 = "sha256-lJapSgRVENTrbmpVyn+UQabC9fpV1G1e+CdlJ090uvg=";
        };
        file = "themes/Catppuccin Macchiato.tmTheme";
      };
    };
    eza = {
      enable = true;
      enableFishIntegration = true;
      icons = "auto";
      colors = "auto";
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      options = [
        "--cmd cd"
      ];
    };

    starship = {
      enable = true;
      enableFishIntegration = true;
      enableInteractive = true;
      enableTransience = true;
    };

    fish = {
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
        cat = "bat"; # Use bat instead of cat cuz its cute :3
        emacs = "emacs -nw";
        rm = "trash";
      };
      shellInit = ''
        set -g fish_greeting
        fish_hybrid_key_bindings
        krabby random 1,3,4,5,7 --no-mega --no-gmax --padding-left 3
      '';
    };
  };
}
