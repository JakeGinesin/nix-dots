{
  description = "Nixos config flake";

  inputs = {
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    flake-parts,
    self,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        # To import a flake module
        # 1. Add foo to inputs
        # 2. Add foo as a parameter to the outputs function
        # 3. Add here: foo.flakeModule
        #cajun-xmonad.default
      ];
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {
        config,
        self',
        inputs',
        pkgs,
        system,
        ...
      }: {
        # Per-system attributes can be defined here. The self' and inputs'
        # module parameters provide easy access to attributes of the same
        # system.

        # Equivalent to  inputs'.nixpkgs.legacyPackages.hello;
        # packages.default = pkgs.hello;
        # formatter = pkgs.nixfmt-rfc-style;
        formatter = pkgs.alejandra;
      };
      flake = {
        # The usual flake attributes can be defined here, including system-
        # agnostic ones like nixosModule and system-enumerating ones, although
        # those are more easily expressed in perSystem.
        # nixosConfigurations.myhostname = "thonkpad";
        nixosConfigurations.thonkpad = inputs.nixpkgs.lib.nixosSystem rec {
          system = "x86_64-linux";
          pkgs = import inputs.nixpkgs {
            inherit system;

            config = {
              allowUnfree = true;
              packageOverrides = pkgs: {
                # "package" = pkgs."package".overrideAttrs (attrs: {...})
              };
            };
            overlays = [
              # inputs.emacs-overlay.overlay -- breaks doom on 30.??
            ];

            home.packages = with pkgs; [xrandr procps polybar bspwm sxhkd];
          };
          specialArgs = {inherit inputs;};
          # extraSpecialArgs = {inherit inputs;};
          modules = [
            ./configuration.nix
            # inputs.nixos-hardware.nixosModules.system76-gaze18
            # agenix
            # agenix.nixosModules.default
            # home manager
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.synchronous = import ./home/home.nix;
              home-manager.extraSpecialArgs = {inherit inputs;};
              home-manager.backupFileExtension = "hm-backup";

              # Optionally, use home-manager.extraSpecialArgs to pass
              # arguments to home.nix
            }
          ];
        };
      };

      # outputs = { self, nixpkgs, ... }@inputs: {
      #   nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      #     specialArgs = {inherit inputs;};
      #     modules = [
      #       ./configuration.nix
      #       # inputs.home-manager.nixosModules.default
      #       { home-manager.users.synch = import ./home.nix; }
      #     ];
      #   };
      # };
    };
}
