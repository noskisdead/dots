{
  description = "nosk's everyday dots :3";

  inputs = {
    # Flakes
    home-manager.url = "github:nix-community/home-manager";
    caelestia-shell.url = "github:caelestia-dots/shell";
    zen-browser.url = "github:youwen5/zen-browser-flake";
    nvf.url = "github:notashelf/nvf";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.pen = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/pen/configuration.nix
        inputs.nvf.nixosModules.default
        inputs.home-manager.nixosModules.default
        {
          # This block needs its own curly braces
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.kenny = {
              imports = [
                ./hosts/pen/home.nix
                inputs.caelestia-shell.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
