{
  description = "nosk's everyday dots :3";

  inputs = {
    home-manager.url = "github:nix-community/home-manager";
    caelestia-shell.url = "github:caelestia-dots/shell";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    #nixos-hardware.url = "github:NixOS/nixos-hardware/master";
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
    nixosConfigurations.pearl = nixpkgs.lib.nixosSystem {
      specialArgs = {inherit inputs;};

      modules = [
        ./hosts/pearl/configuration.nix
        #inputs.nixos-hardware.nixosModules.dell-xps-13-9380
        inputs.nvf.nixosModules.default
        inputs.nix-flatpak.nixosModules.nix-flatpak
        inputs.home-manager.nixosModules.default
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = {inherit inputs;};
            users.kenny = {
              imports = [
                ./hosts/pearl/home.nix
                inputs.caelestia-shell.homeManagerModules.default
              ];
            };
          };
        }
      ];
    };
  };
}
