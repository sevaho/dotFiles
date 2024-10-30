{
  description = "Nixos config flake";

  inputs = {
    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/0.1";

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    # nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-stable.url = "https://flakehub.com/f/NixOS/nixpkgs/0.2405.0";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, determinate, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
        # not sure what the following does
        # specialArgs = {inherit inputs;};
        modules = [
          determinate.nixosModules.default

          #  This is required so we can use both stable and unstable nixpkgs
          {
            nixpkgs.overlays = [
              (final: prev: {
                stable = nixpkgs-stable.legacyPackages.${prev.system};
              })
            ];
          }
          ./nixos/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sevaho = import ./home-manager/home.nix;
          }
        ];
    };
  };
}
