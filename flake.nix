{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
  } @ inputs: let
    baseModule = {
      # imports = [
      # home-manager.nixosModules.default
      # ];
      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
      nixpkgs.overlays = [];
    };
  in {
    nixosConfigurations.thonkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        baseModule
        {
          environment.systemPackages = [agenix.packages.x86_64-linux.default];
        }
        home-manager.nixosModules.default
        agenix.nixosModules.default
        # agenix.homeManagerModules.age
        ./hosts/thonkpad/configuration.nix
      ];
    };

    nixosConfigurations.rq = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        baseModule
        {
          environment.systemPackages = [agenix.packages.x86_64-linux.default];
        }
        home-manager.nixosModules.default
        agenix.nixosModules.default
        # agenix.homeManagerModules.age
        ./hosts/rq/configuration.nix
      ];
    };

    nixosConfigurations.yoga = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      modules = [
        baseModule
        {
          environment.systemPackages = [agenix.packages.x86_64-linux.default];
        }
        home-manager.nixosModules.default
        agenix.nixosModules.default
        # agenix.homeManagerModules.age
        ./hosts/yoga/configuration.nix
      ];
    };
  };
}
