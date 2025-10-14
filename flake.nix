{
  description = "NixOS system configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    agenix.url = "github:ryantm/agenix";

    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-clisp.url = "github:NixOS/nixpkgs/da320e5472f021b96a883f71fc525ca0e4815273";
    nixpkgs-signal.url = "github:NixOS/nixpkgs/e6f23dc08d3624daab7094b701aa3954923c6bbb";

    verus-flake.url = "github:JakeGinesin/verus-flake";
  };
  outputs = {
    self,
    nixpkgs,
    home-manager,
    agenix,
    emacs-overlay,
    nixpkgs-clisp,
    nixpkgs-signal,
    verus-flake,
  } @ inputs: let
    system = "x86_64-linux";

    # hostnames
    hosts = ["thonkpad" "rq" "yoga" "server1" "server2" "server3"];

    baseModule = {lib, ...}: {
      imports = [
        home-manager.nixosModules.default
        agenix.nixosModules.default
      ];
      system.configurationRevision = lib.mkIf (self ? rev) self.rev;
      nixpkgs.overlays = [
        emacs-overlay.overlay
        (final: _prev: {
          clisp = nixpkgs-clisp.legacyPackages.${system}.clisp;
          signal-desktop = nixpkgs-signal.legacyPackages.${system}.signal-desktop;
        })
      ];
      environment.systemPackages = [
        agenix.packages.${system}.default
        # verus-flake.packages.default
        verus-flake.packages.${system}.default
      ];
    };

    mkHost = name: {
      name = name;
      value = nixpkgs.lib.nixosSystem {
        modules = [
          baseModule
          ./hosts/${name}/configuration.nix
        ];
      };
    };
  in {
    nixosConfigurations = builtins.listToAttrs (map mkHost hosts);
  };
}
