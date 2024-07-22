{
  description = "My NixOS configuration flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs"; # follow means it inherits its value:
      # home-manager.inputs.nixpkgs will match inputs.nixpkgs of current flake
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let
    systemSettings = {
      system = "x86_64-linux";
      host = "porcupine";
      timeZone = "America/Los_Angeles";
    };
  in {
    nixosConfigurations = {
      porcupine = nixpkgs.lib.nixosSystem {
        system = systemSettings.system;
        specialArgs = {
          inherit inputs;
          inherit systemSettings;
        };
        modules = [
          ./nixos/hosts/porcupine/configuration.nix
          home-manager.nixosModules.home-manager {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.zyllo = import ./home-manager/home.nix;
           };
          }
        ];
      };
    };
  };
}
