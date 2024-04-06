{
  description = "system config";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly.url = "github:nix-community/neovim-nightly-overlay";
  };
  outputs = inputs@{ nixpkgs, darwin, home-manager, neovim-nightly, ... }:
    let
      overlays = [ neovim-nightly.overlay ];
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
                  users.${username}.imports = [ ./modules/home-manager ];
                };
              }
            ];
            system = system;
          };
    in
    {
      darwinConfigurations.mblue = darwinSystem {
        system = "aarch64-darwin";
        username = "alex";
      };
      darwinConfigurations.vmdev = darwinSystem {
        system = "aarch64-darwin";
        username = "alex";
      };
    };
}
