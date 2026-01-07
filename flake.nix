{
  description = "nosk's flake";

  inputs = {
    # Flakes
    home-manager.url = "github:nix-community/home-manager";
    caelestia-shell.url = "github:caelestia-dots/shell";
    zen-browser.url = "github:youwen5/zen-browser-flake";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations.pen = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/pen/configuration.nix
        inputs.home-manager.nixosModules.default { # This block needs its own curly braces
          home-manager.useGlobalPkgs = true;
	  home-manager.useUserPackages = true;
	  home-manager.extraSpecialArgs = { inherit inputs ;};
          home-manager.users.kenny = {
            imports = [
              ./hosts/pen/home.nix
              inputs.caelestia-shell.homeManagerModules.default
            ];
          };
        }
      ];
    };
  };
}
