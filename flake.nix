{
  description = "Nixos config flake";

  inputs = {
    nix-darwin.url = "github:LnL7/nix-darwin";

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, home-manager, nix-darwin, ... } @ inputs:
    let
      inherit (self) outputs;
    in
    {

    overlays = import ./overlays/default.nix { inherit inputs; };

    nixosConfigurations.desktop-nixos-workstation = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs outputs; };
        modules = [
          ./hosts/desktop-nixos-workstation/configuration.nix
          home-manager.nixosModules.home-manager
          {
            # home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sevaho = import ./hosts/desktop-nixos-workstation/home.nix;
            home-manager.extraSpecialArgs = { inherit inputs outputs; };

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
