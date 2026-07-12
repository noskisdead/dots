{
  description = "nosk's everyday dots :3";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    caelestia-shell.url = "github:caelestia-dots/shell";
    nvf.url = "github:notashelf/nvf";
    slippi.url = "github:lytedev/slippi-nix";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    caelestia-shell.inputs.nixpkgs.follows = "nixpkgs";
    nvf.inputs.nixpkgs.follows = "nixpkgs";
    slippi.inputs.nixpkgs.follows = "nixpkgs";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = {nixpkgs, ...} @ inputs: {
    nixosConfigurations.pearl = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/pearl/configuration.nix
        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            extraSpecialArgs = {inherit inputs;};
            users.kenny.imports = [./hosts/pearl/home.nix];
            useGlobalPkgs = true;
            useUserPackages = true;
          };
        }
      ];
    };
  };
}
