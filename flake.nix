{
  description = "Nixos config flake";

  inputs = {
    nix-darwin.url = "github:LnL7/nix-darwin";


    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";


    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, nix-darwin, ... }@inputs: {
    nixosConfigurations.desktop-nixos-workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        modules = [
          #  This is required so we can use both stable and unstable nixpkgs
          {
            nixpkgs.overlays = [
              (final: prev: {
                stable = nixpkgs-stable.legacyPackages.${prev.system};
              })
            ];
          }
          ./hosts/desktop-nixos-workstation/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sevaho = import ./hosts/desktop-nixos-workstation/home.nix;
          }
        ];
    };

    darwinConfigurations = {
        # Build darwin flake using:
        # $ darwin-rebuild build --flake .#sevahos-MacBook-Pro
        "sevahos-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
            modules = [ 
                # determinate.darwinModules.default
                ./hosts/laptop-macos-work/darwin.nix
                home-manager.darwinModules.home-manager
                {
                home-manager.users.sevaho = import ./hosts/laptop-macos-work/home.nix;
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                }

            ];
            specialArgs = { inherit inputs; };
        };

        # Expose the package set, including overlays, for convenience.
        darwinPackages = self.darwinConfigurations."sevahos-MacBook-Pro".pkgs;
    };
  };
}
