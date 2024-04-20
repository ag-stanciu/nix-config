{
  description = "system config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = inputs@{ self, nixpkgs, darwin, home-manager, neovim-nightly, ... }:
    let
      overlays = [ neovim-nightly.overlay ];
      home-config = import ./modules/home-manager { inherit inputs; };
      darwinSystem = { system, username }:
        darwin.lib.darwinSystem
          {
            modules = [
              {
                nixpkgs.overlays = overlays;
                users.users.${username}.home = "/Users/${username}";
              }
              ./modules/darwin
              home-manager.darwinModules.home-manager
              {
                home-manager = {
                  useGlobalPkgs = true;
                  useUserPackages = true;
                  users.${username} = home-config;
                };
              }
            ];
            system = system;
          };
    in
    {
      darwinConfigurations.mgray = darwinSystem {
        system = "aarch64-darwin";
        username = "alex";
      };
      darwinConfigurations.vmdev = darwinSystem {
        system = "aarch64-darwin";
        username = "alex";
      };
      packages.aarch64-darwin.default = self.darwinConfigurations."mblue".system;
    };
}
