{
  description = "NixOS system configuration";

  nixConfig = {
    # substituters = [
    # "https://cache.nixos.org/"
    # "https://nix-community.cachix.org"
    # ];
    # trusted-public-keys = [
    # "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
    # "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    # ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
  }: let
    baseModule = {
      imports = [
        home-manager.nixosModules.default
      ];
      system.configurationRevision = nixpkgs.lib.mkIf (self ? rev) self.rev;
      nixpkgs.overlays = [];
    };
  in {
    nixosConfigurations.thonkpad = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        baseModule
        ./hosts/thonkpad/configuration.nix
      ];
    };
  };
}
